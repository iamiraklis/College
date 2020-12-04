
public class Run extends Thread {
	Worker worker;
	Broker broker;
	CandC cAndC;
	int instance;

	Run(Worker worker) {
		instance = 1;
		this.worker = worker;
	}

	Run(Broker broker) {
		instance = 2;
		this.broker = broker;
	}
 
	Run(CandC cAndC) {
		instance = 3;
		this.cAndC = cAndC;
	}

	public void run() {
		try {
			switch (instance) {
			case 1:
				worker.start();
				break;
			case 2:
				broker.start();
				break;
			case 3:
				cAndC.start();
				break;
			}

		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}
	}

}
