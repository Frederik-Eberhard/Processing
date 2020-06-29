DynArray d;
Stack s;
void setup(){
  d = new DynArray();
  s = new Stack();
}
void draw(){
  println(s.isEmpty());
  s.push(5);
  s.push(12);
  println(s.pop());
  println(s.top());
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
