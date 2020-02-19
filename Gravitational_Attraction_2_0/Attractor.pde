class Attractor {
  PVector location;
  int mass, G;
  boolean dragging,hover;

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
    dragging = false;
    hover = false;
  }

  PVector attract (Mover m) {
    
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