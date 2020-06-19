Queue q;
Variable_Stack v;

void setup() {
  size(640, 180);                     // Fenstergroesse in Breite und Hoehe
  background(0);                      // Hintergrundfarbe von Schwarz (0) bis Weiss (255) 
  fill(#66cc66);                      // Textfarbe als RGB 
  textSize(24);                       // Textgroesse, kann spaeter geaendert werden
  surface.setResizable(true);         //  Darf die Fenstergroesse veraendert werden oder nicht?
  q = new Queue(5);
  v = new Variable_Stack();
}


void draw() {
  background(0);
  text("Erste Stelle",5,30);
  text(q.top(),50,60);
  text("Schlange",190,30);
  q.show();  
  
  text("Erste Stelle",5+350,30);
  text(v.top(),50+350,60);
  
  text("Stapel",190+350,30);
  v.show();
}

void keyPressed() {
  q.push(int(key));
  v.push(int(key));
}

void mouseClicked(){
  q.pop();
  v.pop();
  println("Empty?: " + v.isEmpty());
  
}
