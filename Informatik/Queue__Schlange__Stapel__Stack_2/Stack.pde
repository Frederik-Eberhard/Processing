class Stack {
  Integer[] S;
  Stack(int n) {
    S = new Integer[n];
  }

  boolean isEmpty() {
    return S[0] == null? true:false;
  }

  int top() {
    try {
      return S[0];
    }
    catch(Exception e) {
      return 0;
    }
  }

  void push(int e) {
    for (int i = S.length-1; i > 0; i--) {
      S[i] = S[i-1];
    }
    S[0] = e;
  }

  void pop() {
    for (int i = 0; i < S.length-1; i++) {
      S[i] = S[i+1];
    }
    S[S.length-1] = null;
  }

  void show() {
    for (int i = 0; i < S.length; i++) {
      try {
        text(S[i], 230+325, 60+25*i+1);
      }
      catch(Exception e) {
        text(char(00000000), 230, 60+25*i+1);
      }
    }
  }
}
