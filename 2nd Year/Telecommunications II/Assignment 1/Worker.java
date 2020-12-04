import java.net.DatagramSocket;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetSocketAddress;

/**
 *
 * Worker class
 * 
 * An instance accepts user input
 *
 */

public class Worker extends Node {
	static int DEFAULT_SRC_PORT = 50002;
	static int DEFAULT_DST_PORT = 50001;
	static final String DEFAULT_DST_NODE = "localhost";
	Terminal terminal;
	InetSocketAddress dstAddress;

	/**
	 * Constructor
	 * 
	 * Attempts to create socket at given port and create an InetSocketAddress for
	 * the destinations
	 */
	Worker(Terminal terminal, String dstHost, int dstPort, int srcPort) {
		try {
			this.terminal = terminal;
			dstAddress = new InetSocketAddress(dstHost, dstPort);
			socket = new DatagramSocket(srcPort);
			listener.go();
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Assume that incoming packets contain a String and print the string.
	 * 
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public synchronized void onReceipt(DatagramPacket packet) throws IOException, InterruptedException {
		DatagramPacket tempPacket = packet;
		boolean dropout = false;
		StringContent content = new StringContent(packet);
		String dataString = " ";
		terminal.println("Broker: " + content.toString());
		byte[] data = (terminal.read("Send work or type drop: ")).getBytes();
		packet = new DatagramPacket(data, data.length, dstAddress);
		dataString = new String(data);
		terminal.println("You replied: " + dataString);
		if (dataString.trim().equalsIgnoreCase("drop")) {
			dropout = true;
		}
		if (!dropout) {
			packet.setSocketAddress(tempPacket.getSocketAddress());
			socket.send(packet);
		}
	}

	/**
	 * Sender Method
	 * 
	 */
	public synchronized void start() throws Exception {
		terminal.println("What's your name?");
		byte[] dataName = (terminal.read("Send: ")).getBytes();
		String dataNameString = new String(dataName);
		terminal.println("Hey, " + dataNameString + ". Do you want to work?");
		byte[] data = (terminal.read("Send: ")).getBytes();
		String dataString = new String(data);
		DatagramPacket packetBrocker = new DatagramPacket(data, data.length, dstAddress);
		socket.send(packetBrocker);
		terminal.println("You replied: " + dataString);
	}
}