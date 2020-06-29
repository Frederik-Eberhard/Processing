class Stack {
  private int[] array;

  Stack() {
    array = new int[0];
  }

  boolean isEmpty() {
    return array.length == 0? true:false;
  }
  
  int getItem(int index) {
    return array[index];
  }
  
  int top() {
    return array[0];
  }
  
  void push(int inhalt) {
    int tarray[] = new int[array.length+1];
    for (int i = 0; i < array.length; i++) {
      tarray[i] = array[i];
    }    
    array = new int[tarray.length];
    array[0] = inhalt;
    for (int i = 1; i < array.length; i++) {
      array[i] = tarray[i-1];
    }
  }
  
  int pop() {
    int a = array[0];
    int tarray[] = new int[array.length-1]; 
    for (int i = 0; i < tarray.length; i++) {
      tarray[i] = array[i+1];
    } 
    array = new int[tarray.length];
    for (int i = 0; i < array.length; i++) {
      array[i] = tarray[i];
    }
    return a;
  }
}
