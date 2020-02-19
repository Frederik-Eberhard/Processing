Ball b;

void setup(){
  size(400,300);
  b = new Ball();
}

void draw(){
  background(255);
  b.move();
  b.bounce();
  b.display(); 
}