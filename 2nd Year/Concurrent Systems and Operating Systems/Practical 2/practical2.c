
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "cond.c"

pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER; //initializing mutex
pthread_cond_t v = PTHREAD_COND_INITIALIZER;   //initializing conditional variable
int c = 1;                                     //creating condition
// We want threads to be "working" for less than a second
int work (int ms, struct timespec *ts) {
    ts->tv_sec = 0;
    ts->tv_nsec = 1000 * ms;
    nanosleep(ts,NULL);
    return 0;
}
// timespecs for producer and consumer
struct timespec tsP,tsC;


int pnum;  // number updated when producer runs.
int csum;  // sum computed using pnum when consumer runs.

int (*pred)(int); // predicate indicating number to be consumed

int produceT() {
  scanf("%d",&pnum); // read a number from stdin
  return pnum;
}

void *Produce(void *a) {
  int p;

  p=1;
  while (p) {
  pthread_mutex_lock(&m); //lock the thread
    printf("@P-WORK\n");
    work(100,&tsP); // "work" for 100ms
    printf("@P-READY\n");
    p = produceT();
    printf("@PRODUCED %d\n",p);
    pthread_cond_signal(&v);
    c = 0; //set condition to 0 
     while (!c){
  		pthread_cond_wait(&v, &m);
  	  }
    pthread_mutex_unlock(&m); //unlock the thread
    
   
  }
  printf("@P-EXIT\n");
  pthread_exit(NULL);
}


int consumeT() {
  if ( pred(pnum) ) { csum += pnum; }
  return pnum;
}

void *Consume(void *a) {
  int p;

  p=1;
  while (p) {
  pthread_mutex_lock(&m); //lock the thread
  while (c){
  pthread_cond_wait(&v, &m);
  }
    printf("@C-WORK\n");
    work(50+100*(rand()%3),&tsC); // "work" for 50ms, 150ms, or 250ms
    printf("@C-READY\n");
    p = consumeT();
    printf("@CONSUMED %d\n",csum);
    c =1; //set condition to 1 
    pthread_cond_signal(&v);
    pthread_mutex_unlock(&m); //unlock the thread
   
  }
  printf("@C-EXIT\n");
  pthread_exit(NULL);
}


int main (int argc, const char * argv[]) {
  // the current number predicate
  static pthread_t prod,cons;
	long rc;

  pred = &cond1;
  if (argc>1) {
    if      (!strncmp(argv[1],"2",10)) { pred = &cond2; }
    else if (!strncmp(argv[1],"3",10)) { pred = &cond3; }
  }


  pnum = 999;
  csum=0;
  srand(time(0));

  printf("@P-CREATE\n");
 	rc = pthread_create(&prod,NULL,Produce,(void *)0);
	if (rc) {
			printf("@P-ERROR %ld\n",rc);
			exit(-1);
		}
  printf("@C-CREATE\n");
 	rc = pthread_create(&cons,NULL,Consume,(void *)0);
	if (rc) {
			printf("@C-ERROR %ld\n",rc);
			exit(-1);
		}

  printf("@P-JOIN\n");
  pthread_join( prod, NULL);
  printf("@C-JOIN\n");
  pthread_join( cons, NULL);


  printf("@CSUM=%d.\n",csum);

  return 0;
}
