Ball[] balls;

void setup(){
  size(640,360);
  balls = new Ball[5];
  for (int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}

void draw(){
  background(255);
  
  for (Ball b : balls) {  
     
    PVector gravity = new PVector(0,0.3);
    gravity.mult(b.mass); //so that Gravity is equal between Objects
    b.applyForce(gravity);
    if(mousePressed){
      PVector wind = new PVector(0.2,0);
       b.applyForce(wind);
    }
    
    b.move();
    b.bounce();
    b.display(); 
  }
}