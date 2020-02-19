Ball b;

void setup(){
  size(640,360);
  b = new Ball();
}

void draw(){
  background(255);
   
  PVector f = new PVector(0,0.3);
  b.applyForce(f);
  
  
  b.move();
  b.bounce();
  b.display(); 
}