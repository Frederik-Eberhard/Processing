class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Ball(){
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,2);
    acceleration = new PVector(0.01,0);
  }
  
  void move(){
    PVector mouse = new PVector(mouseX,mouseY);
    mouse.sub(location);
    //mouse.setMag(.5);
    mouse.mult(.05);
    acceleration = mouse;
    //acceleration = PVector.random2D();  
    
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
  }
   
  void bounce(){
    if (location.x > width) location.x = 0;
    if (location.x < 0) location.x = width;
    if (location.y > height) location.y = 0;
    if (location.y < 0) location.y = height;
  }
  
  void display(){
    fill(0);
    ellipse(location.x,location.y,40,40);
  }
}