class Attractor {
  PVector location;
  int mass, G;

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
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
  
  void display() {
    stroke(0);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}