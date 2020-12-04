import java.io.IOException;
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.net.InetSocketAddress;
import java.net.SocketException;

public class EndUser2 extends Node implements Runnable {

	private Terminal terminal;

	EndUser2(Terminal terminal, int port) {
		try {
			this.terminal = terminal;
			socket = new DatagramSocket(port);
			listener.go();
		} catch (SocketException e) { e.printStackTrace(); }
	}

	public void onReceipt(DatagramPacket packet) {
		byte[] data;
		String content;
		byte[] buffer;

		data = packet.getData();

		buffer = new byte[data[CONSTANT.LENGTH_POS]];
		System.arraycopy(data, CONSTANT.HEADER_LENGTH, buffer, 0, buffer.length);
		content = new String(buffer);

		terminal.println("Message = " + content);
	}

	private synchronized void sendMessage(String input, int port) {
		byte[] buffer;
		byte[] data;
		DatagramPacket packet;

		buffer = input.getBytes();
		data = new byte[CONSTANT.HEADER_LENGTH + buffer.length];
		data[CONSTANT.TYPE_POS] = CONSTANT.STRING_TYPE;
		data[CONSTANT.LENGTH_POS] = (byte)buffer.length;

		System.arraycopy(buffer, 0, data, CONSTANT.HEADER_LENGTH, buffer.length);

		packet = new DatagramPacket(data, data.length);
		packet.setSocketAddress(new InetSocketAddress(CONSTANT.DSTHOST, port));

		try {
			socket.send(packet);
		}
		catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void run() {
		while (true) {
			terminal.println("Input text to send: ");
			String input = terminal.read("-->");

			sendMessage(input, CONSTANT.ROUTER_3);
		}
	}
	
	 public static void main(String[] args) {
	    	try {
	    		Terminal terminal = new Terminal("EndUser 2");
	    		(new EndUser2(terminal, CONSTANT.END_USER_2)).run();
	    	} catch(java.lang.Exception e) {e.printStackTrace();}
	    }
}
