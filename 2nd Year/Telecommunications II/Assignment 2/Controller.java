import java.io.IOException;
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.net.InetSocketAddress;
import java.util.*;
import java.lang.System;

public class Controller extends Node implements Runnable {

	private Terminal terminal;
	private ArrayList<Integer> routers = new ArrayList<>();
	private static HashMap<Integer, int[]> flowTable = new HashMap<>();

	Controller(Terminal terminal, int port) {
		try {
			this.terminal = terminal;
			socket = new DatagramSocket(port);
			listener.go();
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}

	public synchronized void onReceipt(DatagramPacket packet) {
        byte[] data;
        String content;
        byte[] buffer;

        data = packet.getData();

        buffer = new byte[data[CONSTANT.LENGTH_POS]];
        System.arraycopy(data, CONSTANT.HEADER_LENGTH, buffer, 0, buffer.length);
        content = new String(buffer);
        int packetPort = packet.getPort();
       
        terminal.println("received");
       
        if(content.equalsIgnoreCase("Hello!")) {
       
        terminal.println(content);
        sendMessage("Hello router!", packetPort);
        this.notify();
       
        }
       
        if(packetPort==CONSTANT.END_USER_1_ROUTER_1 && content.equalsIgnoreCase("flowtable")) {
       
        int[] routerPorts = flowTable.get(CONSTANT.END_USER_1);
       
       
        for(int i=0; i<routerPorts.length-1; i++) {
        sendMessage("next port:" + routerPorts[i+1], routerPorts[i]);
        }
       
        sendMessage("next port:" + CONSTANT.END_USER_2, routerPorts[routerPorts.length-1]);
       
        sendMessage("forwardMessage", routerPorts[0]);
       
       
        }
       
        if(packetPort==CONSTANT.ROUTER_3_END_USER_2 && content.equalsIgnoreCase("flowtable")) {
       
       
        int[] routerPorts = flowTable.get(CONSTANT.END_USER_2);
       
        for(int i=0; i<routerPorts.length-1; i++) {
        sendMessage("next port:" + routerPorts[i+1], routerPorts[i]);
        }
       
        sendMessage("next port:" + CONSTANT.END_USER_1, routerPorts[routerPorts.length-1]);
       
        sendMessage("forwardMessage", routerPorts[0]);
       
       
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

	 public void generateFlowTable() {

		    int[] user1to2 = {50000, 50001, 50002};
		    int[] user2to1 = {50002, 50001, 50000};
		   
		    flowTable.put(CONSTANT.END_USER_1, user1to2);
		    flowTable.put(CONSTANT.END_USER_2, user2to1);
		   
		}


	public synchronized void run() {
		try {
			this.wait(2500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		generateFlowTable();

		try {
			this.wait();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		try {
			Terminal terminal = new Terminal("Controller");
			(new Controller(terminal, CONSTANT.CONTROLLERPORT)).run();
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}
}
