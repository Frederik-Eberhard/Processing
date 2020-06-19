class DynArray{
  private int[] array;
  
  DynArray(){
    array = new int[0];
  }
  
  boolean isEmpty(){
    return array.length == 0? true:false;
  }
  int getItem(int index){
    return array[index];
  }
  void append(int inhalt){
    int tarray[] = new int[array.length+1];
    for(int i = 0; i < array.length; i++){
      tarray[i] = array[i];
    }
    tarray[tarray.length-1] = inhalt;
    array = new int[array.length+1];
    for(int i = 0; i < array.length; i++){
      array[i] = tarray[i];
    }
  }
  void insertAt(int index, int inhalt){
    int tarray[] = new int[array.length +1];
    for(int i = 0; i < tarray.length; i++){
      if(i < index)
        tarray[i] = array[i];
      if(i == index)
        tarray[i] = inhalt;
      if(i > index)
        tarray[i] = array[i-1];
    }
    array = new int[array.length+1];
    for(int i = 0; i < array.length; i++){
      array[i] = tarray[i];
    }    
  }
  void setItem(int index, int inhalt){
    array[index] = inhalt; 
  }
  void delete (int index){
    int tarray[] = new int[array.length -1];
    for(int i = 0; i < tarray.length; i++){
      if(i < index)
        tarray[i] = array[i];
      if(i > index)
        tarray[i] = array[i+1];
    }
    array = new int[array.length-1];
    for(int i = 0; i < array.length; i++){
      array[i] = tarray[i];
    }    
  }
  int getLength(){
    return array.length;
  }
}
