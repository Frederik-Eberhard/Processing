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
  
  a.display();
  m.display();
}