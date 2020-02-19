Attractor a;
Mover m;

void setup() {
  size(680, 360);
  //fullScreen();
  a = new Attractor();
  m = new Mover();
}

void draw() {
  background(0);
  
  PVector force = a.attract(m);
  m.applyForce(force);
  m.update();
  
  a.drag();
  a.hover(mouseX,mouseY);
  
  a.display();
  m.display();
}

void mousePressed(){
  a.clicked(mouseX,mouseY);
}

void mouseReleased(){
  a.stopDragging();
}