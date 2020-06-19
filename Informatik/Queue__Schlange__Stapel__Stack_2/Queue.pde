class Queue {
  Integer[] Q = new Integer[5];
  int pointerindex;

  Queue(int n) {
    Q = new Integer[n];
    pointerindex = 0;
  }

  boolean isEmpty(){
    return Q[0] == null? true:false;
  }
  
  int top() {
    try{
      return Q[0];
    }catch(Exception e){
      return 0;
    }
  }

  void push(int e) {
    if (pointerindex > Q.length-1) {
      pop();
      pointerindex = Q.length-1;
    }
    Q[pointerindex] = e;
    pointerindex++;
  }

  void pop() {
    for (int i = 0; i < Q.length-1; i++) {
      Q[i] = Q[i+1];
    }
    Q[Q.length-1] = null;
    pointerindex = pointerindex > 0? pointerindex-1: 0;
  }
  
  void show(){
    for(int i = 0; i < Q.length; i++){
      try{
        text(Q[i],230,60+25*i+1);
      }catch(Exception e){
        text(char(00000000),230,60+25*i+1);      
      }
    }
  }
}
