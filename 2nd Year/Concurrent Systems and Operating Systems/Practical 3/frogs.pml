#define NUM_THREADS 5


int x; // Global variable !!
int pos[5] = {3, 1, 2, 4, 5};

mtype = { locked, unlocked };

mtype mutex = unlocked;
int mid = 0;
int init_id;

inline lock(m) { atomic{ (m==unlocked) -> m = locked; mid=_pid } }

inline unlock(m) {
  atomic{
    assert(mid==_pid);
    m = unlocked;
    mid=init_id
  }
}


proctype FROGS1(){
 int tmp;
  		
  do
  	
  //---------jump over second frog-------- 	
  	::(pos[0] - pos[1] ==1)->
  		
  		if
  		::lock(mutex);
  		fi
  		
  		if
  		::printf("FROG1 from %d to %d\n", pos[1], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[1];
  		fi
  		
  		if
  		::pos[1] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  		
 //---------jump over second frog--------
   ::(pos[0] - pos[1] ==2)->
  		
  		if
  		::lock(mutex);
  		fi
  		
  		if
  		::printf("FROG1 from %d to %d\n", pos[1], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[1];
  		fi
  		
  		if
  		::pos[1] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  od
}

proctype FROGS2(){
 int tmp;
  do
  	
  //---------jump over second frog-------- 	
  	::(pos[0] - pos[2] ==1)->
  		
  		if
  		::lock(mutex);
  		fi
  		
  		if
  		::printf("FROG2 from %d to %d\n", pos[2], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[2];
  		fi
  		
  		if
  		::pos[2] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  		
 //---------jump over second frog--------
   ::(pos[0] - pos[2] ==2)->
  		
  		if
  		::lock(mutex);
  		fi
  		
  		if
  		::printf("FROG2 from %d to %d\n", pos[2], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[2];
  		fi
  		
  		if
  		::pos[2] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  od
}

proctype FROGS3(){
 int tmp;
  
  do
  	
  //---------jump over second frog-------- 	
  	::(pos[0] - pos[3] ==-1)->
  		
  		if
  		::lock(mutex);
  		fi
  		
  		if
  		::printf("FROG3 from %d to %d\n", pos[3], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[3];
  		fi
  		
  		if
  		::pos[3] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  		
 //---------jump over second frog--------
   ::(pos[0] - pos[3] ==-2)->
  		
  		if
  		::lock(mutex);
  		::printf("FROG3 RIGHT STARTS AT %d\n", pos[3]);
  		fi
  		
  		if
  		::printf("FROG3 from %d to %d\n", pos[3], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[3];
  		fi
  		
  		if
  		::pos[3] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  od
}

proctype FROGS4(){
 int tmp;

  do
  	
  //---------jump over second frog-------- 	
  	::(pos[0] - pos[4] ==-1)->
  		
  		if
  		::lock(mutex);
  		fi
  		
  		if
  		::printf("FROG4 from %d to %d\n", pos[4], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[4];
  		fi
  		
  		if
  		::pos[4] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  		
 //---------jump over second frog--------
   ::(pos[0] - pos[4] ==-2)->
  		
  		if
  		::lock(mutex);
  		fi
  		
  		if
  		::printf("FROG4 from %d to %d\n", pos[4], pos[0]);
  		fi
  		
  		if
  		::tmp = pos[0];
  		fi
  		
  		if
  		::pos[0] = pos[4];
  		fi
  		
  		if
  		::pos[4] = tmp;
  		fi
  		
  		if
  		::printf("EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", pos[0], pos[1], pos[2], pos[3], pos[4]);
  		fi
  		
  		if
  		::unlock(mutex);
  		fi
  od
}

init {
  run FROGS1();
  run FROGS2();
  run FROGS3();
  run FROGS4();
}
