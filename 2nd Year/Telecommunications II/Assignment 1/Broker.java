import java.net.DatagramSocket;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetSocketAddress;
import java.util.ArrayList;

public class Broker extends Node {
	static final int DEFAULT_SRC_PORT = 50001;
	static final int DEFAULT_DST_PORT = 50000;
	static final int DEFAULT_DST_PORT_WORKER = 50002;
	static final String DEFAULT_DST_NODE = "localhost";

	Terminal terminal;
	InetSocketAddress dstAddress;
	InetSocketAddress dstAddressWorker;
	byte[] data = null;
	StringContent content;
	DatagramPacket packetWorker = null;
	public static ArrayList<Integer> workerList = new ArrayList<Integer>();
	public static boolean yesConditionWorker1 = false;
	public static boolean yesConditionWorker2 = false;
	public static boolean yesConditionWorker3 = false;
	DatagramPacket tempPacket = null;

	/**
	 * Constructor
	 * 
	 * Attempts to create socket at given port and create an InetSocketAddress for
	 * the destinations
	 */
	// Broker(Terminal terminal, String dstHost, int dstPort, int srcPort, int
	// dstPortWorker) {
	Broker(Terminal terminal, int port) {
		try {
			this.terminal = terminal;
			socket = new DatagramSocket(port);
			listener.go();
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Assume that incoming packets contain a String and print the string.
	 * 
	 * @throws IOException
	 */
	public synchronized void onReceipt(DatagramPacket packet) throws Exception {
		int address = packet.getPort();
		content = new StringContent(packet);
		if (address == DEFAULT_DST_PORT) {
			tempPacket = packet;
			terminal.println("Server: " + content.toString());
			for (int i = 0; i <= CandC.noOfWorkers; i++) {
				if (workerList.contains(i)) {
					packet.setPort(DEFAULT_DST_PORT_WORKER + i);
					socket.send(packet);
				}
			}
		} else if (address == DEFAULT_DST_PORT_WORKER) {
			if (!yesConditionWorker1) {
				if (content.toString().trim().equalsIgnoreCase("YES")) {
					terminal.println("Worker 1 has volunteered for work.");
					yesConditionWorker1 = true;
					workerList.add(0);
				} else {
					terminal.println("Worker 1 has not volunteered for work.");
				}
			} else {
				terminal.println("Worker 1: " + content.toString());
				packet.setPort(DEFAULT_DST_PORT);
				socket.send(packet);
			}
		} else if (address == (DEFAULT_DST_PORT_WORKER + 1)) {
			if (!yesConditionWorker2) {
				if (content.toString().trim().equalsIgnoreCase("YES")) {
					terminal.println("Worker 2 has volunteered for work.");
					yesConditionWorker2 = true;
					workerList.add(1);
				} else
					terminal.println("Worker 2 has not volunteered for work.");
			} else {
				terminal.println("Worker 2: " + content.toString());
				packet.setPort(DEFAULT_DST_PORT);
				socket.send(packet);
			}
		} else if (address == (DEFAULT_DST_PORT_WORKER + 2)) {
			if (!yesConditionWorker3) {
				if (content.toString().trim().equalsIgnoreCase("YES")) {
					terminal.println("Worker 3 has volunteered for work.");
					yesConditionWorker3 = true;
					workerList.add(2);
				} else
					terminal.println("Worker 3 has not volunteered for work.");
			} else {
				terminal.println("Worker 3: " + content.toString());
				packet.setPort(DEFAULT_DST_PORT);
				socket.send(packet);
			}
		}
	}

	/**
	 * Sender Method
	 * 
	 */
	public synchronized void start() throws Exception {
	}

}
