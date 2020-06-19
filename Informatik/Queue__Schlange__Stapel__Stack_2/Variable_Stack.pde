class Variable_Stack{
  Stack s;
  
  Variable_Stack(){
    s = new Stack(0);
  }
  
  boolean isEmpty() {
    return s.S.length > 0? false:true;
  }

  int top() {
    return s.top();
  }

  
  void push(int e){
    int a = s.S.length;
    Integer[] T = new Integer[a];
    for(int i = 0; i < s.S.length; i++){
      T[i] = s.S[i];
    }
    s = new Stack(a+1);
    for(int i = 1; i < s.S.length; i++){
      s.S[i] = T[i-1];
    }  
    s.S[0] = e;
  }
  
  void pop(){
    int a = s.S.length;
    Integer[] T = new Integer[a];
    for(int i = 0; i < s.S.length; i++){
      T[i] = s.S[i];
    }
    s = new Stack(a > 0? a-1:0);
    for(int i = 0; i < s.S.length; i++){
      s.S[i] = T[i+1];
    }    
  }
  
  void show() {
    for (int i = 0; i < s.S.length; i++) {
      try {
        text(s.S[i], 230+325, 60+25*i+1);
      }
      catch(Exception e) {
        text(char(00000000), 230, 60+25*i+1);
      }
    }
  }

}
