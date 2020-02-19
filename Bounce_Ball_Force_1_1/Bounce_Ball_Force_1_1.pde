Ball b;

void setup(){
  size(640,360);
  b = new Ball();
}

void draw(){
  background(255);
     
  PVector gravity = new PVector(0,0.3);
  b.applyForce(gravity);
  if(mousePressed){
    PVector wind = new PVector(0.2,0);
    b.applyForce(wind);
  }
    
  b.move();
  b.bounce();
  b.display(); 
}