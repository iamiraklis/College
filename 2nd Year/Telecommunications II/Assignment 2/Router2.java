import java.io.*;
import java.net.*;

public class Router2 extends Node implements Runnable {

	private Terminal terminal;
	private int port;
	private String message;
	//private int destination;

	Router2(Terminal terminal, int port) {
		try {
			this.terminal = terminal;
			this.port = port;
			socket = new DatagramSocket(port);
			listener.go();
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}

	public synchronized void onReceipt(DatagramPacket packet) {
		String content;
		byte[] data;
		byte[] buffer;

		data = packet.getData();

		buffer = new byte[data[CONSTANT.LENGTH_POS]];
		System.arraycopy(data, CONSTANT.HEADER_LENGTH, buffer, 0, buffer.length);
		content = new String(buffer);
		int packetPort = packet.getPort();

		if (content.equalsIgnoreCase("Hello router!")) {
			terminal.println(content);
		}
		if (packetPort == CONSTANT.CONTROLLERPORT && content.contains("next port:")) {
			terminal.println(content);
			port = Integer.parseInt(content.replace("next port:", ""));
		}
		if (packetPort != CONSTANT.CONTROLLERPORT) {
			sendMessage(content, port);
		}
	}

	private synchronized void sendMessage(String input, int port) {
		byte[] buffer;
		byte[] data;
		DatagramPacket packet;

		buffer = input.getBytes();
		data = new byte[CONSTANT.HEADER_LENGTH + buffer.length];
		data[CONSTANT.TYPE_POS] = CONSTANT.STRING_TYPE;
		data[CONSTANT.LENGTH_POS] = (byte) buffer.length;

		System.arraycopy(buffer, 0, data, CONSTANT.HEADER_LENGTH, buffer.length);

		packet = new DatagramPacket(data, data.length);
		packet.setSocketAddress(new InetSocketAddress(CONSTANT.DSTHOST, port));

		try {
			socket.send(packet);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private synchronized void sayHello() {
		sendMessage(CONSTANT.HELLO, CONSTANT.CONTROLLERPORT);
	}

	public synchronized void run() {
		sayHello();

		try {
			this.wait();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		try {
			Terminal terminal = new Terminal("Router 2");
			(new Router2(terminal, CONSTANT.ROUTER_2)).run();
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}
}
