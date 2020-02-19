class Attractor {
  PVector location,velocity,acceleration;
  int mass, G;
  boolean dragging,hover;

  Attractor() {
    //location = new PVector(width/2, height/2);
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = int(random(15,25));
    G = 1;
    dragging = false;
    hover = false;
  }
  
  PVector attract (Attractor m) {
    
    //Direction of the force!
    PVector force = PVector.sub(location, m.location);
    float d = force.mag();
    
    d = constrain(d, 5, 25);  //constrains Value to between 5 & 25
    
    force.normalize();


    // Magnitude of the force!
    float strength = (G * mass * m.mass) / (d * d);
    
    // Putting magnitude and direction together!
    force.mult(strength);
    
    return force;
  }
  
  PVector attract (Mover m) {
    if(!dragging){    //can be disabled
      //Direction of the force!
      PVector force = PVector.sub(location, m.location);
      float d = force.mag();
    
      d = constrain(d, 5, 25);  //constrains Value to between 5 & 25
      
      force.normalize();


      // Magnitude of the force!
      float strength = (G * mass * m.mass) / (d * d);
    
      // Putting magnitude and direction together!
      force.mult(strength);
    
      return force;
    }
    else
      return new PVector(0,0);
  } 

  void applyForce(PVector force){
    acceleration = force;
  }

  void clicked(int x,int y){
    dragging = true;
    location = new PVector(x,y);
  }
  
  void stopDragging(){
    dragging = false; 
  }
  
  void drag(){
    if(dragging){
      location = new PVector(mouseX,mouseY);
    }
  }
  
  void hover(int x, int y){
    if(x < location.x + mass && x > location.x - mass && y < location.y + mass && y > location.y - mass)
      hover = true; 
    else
      hover = false;
    println(hover + "  x " + x + "  y " + y + "  loc x + mass " + (location.x + mass) + "  loc x - mass " + (location.x - mass) + "  loc y + mass " + (location.y + mass) + "  loc y - mass " + (location.y - mass));
  }
 
  void update(){
    velocity.add(acceleration);
    velocity = new PVector(constrain(velocity.x, -10, 10),constrain(velocity.y, -10, 10));  //stops big spreading
    location.add(velocity);
  }
  
  void display() {
    if(dragging && hover)
      fill(200);
    else if(hover)
      fill(230);  
    else
      fill(255);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}