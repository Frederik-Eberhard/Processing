class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
  Ball(){
    location = new PVector(random(width),height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = random(0.5,4);
  }
  
  // Newton#s2nd Law with mass!
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
   }
  
  void move(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
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
    fill(0,100);
    ellipse(location.x,location.y,mass*20,mass*20);
  }
}