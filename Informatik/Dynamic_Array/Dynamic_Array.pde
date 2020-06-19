DynArray d;
void setup(){
  d = new DynArray();
}
void draw(){
  println(d.isEmpty());
  d.append(5);
  d.append(12);
  printAr();
  d.insertAt(1,7);
  printAr();
  d.setItem(0,20);
  printAr();
  d.delete(2);
  printAr();
  noLoop();
}

void printAr(){
  for(int i = 0; i < d.getLength(); i++){
    print(i + ": " + d.getItem(i) + "   ");
  }
  println();
}
