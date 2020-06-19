int[] queue = new int[5];
int pointerindex = 0;

void setup() {
  size(320, 180);                     // Fenstergroesse in Breite und Hoehe
  background(0);                      // Hintergrundfarbe von Schwarz (0) bis Weiss (255) 
  fill(#66cc66);                      // Textfarbe als RGB 
  textSize(24);                       // Textgroesse, kann spaeter geaendert werden
  surface.setResizable(true);         //  Darf die Fenstergroesse veraendert werden oder nicht?
}


void draw() {
  background(0);
  text("Erste Stelle",5,30);
  text(erste(),50,60);
  
  text("Schlange",190,30);
  for(int i = 0; i < queue.length; i++){
    text(queue[i],230,60+25*i+1);
  }
}

void keyPressed() {
  push(int(key));
  println(erste() + " " + int(key));
}

void mouseClicked(){
  pop();
  println(erste());
}

int erste() {
  return queue[0];
}

void pop() {
  for (int i = 0; i < queue.length-1; i++) {
    queue[i] = queue[i+1];
  }
  queue[queue.length-1] = 0;
  pointerindex = pointerindex > 0? pointerindex-1: 0; 
}

void push(int e) {
  if(pointerindex > queue.length-1){
    pop();
    pointerindex = queue.length-1;
  }
  queue[pointerindex] = e;
  pointerindex++;
}
