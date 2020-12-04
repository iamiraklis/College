import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class API extends Thread {

	static final int DEFAULT_SRC_PORT = 50000;
	static final int DEFAULT_DST_PORT = 50001;
	static final String DEFAULT_DST_NODE = "localhost";
	public static int workerPort = 50002;

	Worker worker;
	Broker broker;
	CandC cAndC;
	int instance;

	API(Worker worker) {
		instance = 0;
		this.worker = worker;
	}
	API(Broker broker) {
		instance = 1;
		this.broker = broker;
	}
	API(CandC cAndC) {
		instance = 2;
		this.cAndC = cAndC;
	}

	public void run() {
		try {
			switch (instance) {
			case 0:
				worker.start();
				break;
			case 1:
				broker.start();
				break;
			case 2:
				cAndC.start();
				break;
			}

		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		ExecutorService execute = Executors.newFixedThreadPool(5);
		
		Terminal worker1t = new Terminal("Worker 1");
		Terminal worker2t = new Terminal("Worker 2");
		Terminal worker3t = new Terminal("Worker 3");
		Terminal brokert = new Terminal("Broker");
		Terminal cAndCt = new Terminal("Command and Control");
		
		API worker1 = new API(new Worker(worker1t, DEFAULT_DST_NODE, DEFAULT_DST_PORT, workerPort++));
		API worker2 = new API(new Worker(worker2t, DEFAULT_DST_NODE, DEFAULT_DST_PORT, workerPort++));
		API worker3 = new API(new Worker(worker3t, DEFAULT_DST_NODE, DEFAULT_DST_PORT, workerPort++));
		API broker = new API(new Broker(brokert, DEFAULT_DST_PORT));
		API cAndC = new API(new CandC(cAndCt, DEFAULT_DST_NODE, DEFAULT_DST_PORT, DEFAULT_SRC_PORT));

		execute.execute(worker1);
		execute.execute(worker2);
		execute.execute(worker3);
		execute.execute(broker);
		execute.execute(cAndC);
	}
}
