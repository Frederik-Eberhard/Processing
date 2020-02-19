class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Ball(){
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  // Newton#s2nd Law! (the beginning);
  void applyForce(PVector force){
    acceleration = force;
  }
  
  void move(){
    //PVector mouse = new PVector(mouseX,mouseY);
    //mouse.sub(location);
    //mouse.setMag(0.5);
    //acceleration = mouse;
    //acceleration = PVector.random2D();  
    
    
    velocity.add(acceleration);
    location.add(velocity);
    //velocity.limit(5);
  }
   
  void bounce(){
    if ((location.x > width-20)||(location.x < 0+20)){
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height-20)||(location.y < 0+20)){
      velocity.y = velocity.y * -1;
    }
  }
  
  void display(){
    fill(0);
    ellipse(location.x,location.y,40,40);
  }
}