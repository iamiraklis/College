import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetSocketAddress;

public class CandC extends Node {
	static final int DEFAULT_PORT = 50000;
	static final int DEFAULT_DST_PORT = 50001;
	static final String DEFAULT_DST_NODE = "localhost";

	Terminal terminal;
	InetSocketAddress dstAddress;
	static boolean noMoreWork = false;
	public static int noOfWorkers = 0;

	CandC(Terminal terminal, String dstHost, int dstPort, int srcPort) {
		try {
			this.terminal = terminal;
			socket = new DatagramSocket(srcPort);
			listener.go();
			dstAddress = new InetSocketAddress(dstHost, dstPort);

		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Assume that incoming packets contain a String and print the string.
	 * 
	 * @throws IOException
	 */
	public synchronized void onReceipt(DatagramPacket packet) throws IOException {
		StringContent content = new StringContent(packet);
		System.out.println("work received");
		terminal.println("Work received: " + content.toString());
		byte[] dataWorkDesc = (terminal.read("Send work desc or drop: ")).getBytes();
		String dataString = new String(dataWorkDesc);
		terminal.println("You have chosen: " + dataString);
		if (dataString.trim().equalsIgnoreCase("drop")) {
			noMoreWork = true;
		}
		if (!noMoreWork) {
			terminal.println("How many workers do you require?");
			byte[] dataNoOfWorkers = (terminal.read("Select 1, 2 or all: ")).getBytes();
			String dataNoOfWorkersString = new String(dataNoOfWorkers);
			terminal.println("You selected " + dataNoOfWorkersString + " workers.");
			switch (dataNoOfWorkersString) {
			case "1":
				if (Broker.workerList.size() >= 0) {
					noOfWorkers = 0;
				} else
					noOfWorkers = Broker.workerList.size();
				break;
			case "2":
				if (Broker.workerList.size() >= 1) {
					noOfWorkers = 1;
				} else
					noOfWorkers = Broker.workerList.size();
				break;
			case "all":
				noOfWorkers = Broker.workerList.size();
				break;
			default:
				noOfWorkers = Broker.workerList.size();
			}
			DatagramPacket packetWork = new DatagramPacket(dataWorkDesc, dataWorkDesc.length, dstAddress);
			socket.send(packetWork);
		}
	}

	public synchronized void start() throws Exception {
		terminal.println("Provide a work description or drop");
		byte[] dataWorkDesc = (terminal.read("Send work desc or drop: ")).getBytes();
		String dataString = new String(dataWorkDesc);
		terminal.println("You have chosen: " + dataString);
		if (dataString.trim().equalsIgnoreCase("drop")) {
			noMoreWork = true;
		}
		if (!noMoreWork) {
			terminal.println("How many workers do you require?");
			byte[] dataNoOfWorkers = (terminal.read("Select 1, 2 or all: ")).getBytes();
			String dataNoOfWorkersString = new String(dataNoOfWorkers);
			terminal.println("You selected " + dataNoOfWorkersString + " workers.");
			switch (dataNoOfWorkersString) {
			case "1":
				if (Broker.workerList.size() >= 0) {
					noOfWorkers = 0;
				} else
					noOfWorkers = Broker.workerList.size();
				break;
			case "2":
				if (Broker.workerList.size() >= 1) {
					noOfWorkers = 1;
				} else
					noOfWorkers = Broker.workerList.size();
				break;
			case "all":
				noOfWorkers = Broker.workerList.size();
				break;
			default:
				noOfWorkers = Broker.workerList.size();
			}
			DatagramPacket packetWork = new DatagramPacket(dataWorkDesc, dataWorkDesc.length, dstAddress);
			socket.send(packetWork);

		}
	}
}