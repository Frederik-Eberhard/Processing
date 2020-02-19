class Repulsor {
  PVector location, velocity, acceleration;
  int mass, G;

  Repulsor() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 10;
    G = 1;
  }

  PVector repulse (Repulsor m) {

    //Direction of the force!
    PVector force = PVector.sub(location, m.location);
    float d = force.mag();

    d = constrain(d, 5, 50);  //constrains Value to between 5 & 25

    force.normalize();


    // Magnitude of the force!
    float strength = (G * mass * m.mass) / (d * d);

    // Putting magnitude and direction together!
    force.mult(strength);
    // Insted of attraction it repulses!
    force = new PVector(force.x * -1, force.y * -1);  

    return force;
  } 

  PVector repulse (Mover m) {

    //Direction of the force!
    PVector force = PVector.sub(location, m.location);
    float d = force.mag();

    d = constrain(d, 5, 50);  //constrains Value to between 5 & 25

    force.normalize();


    // Magnitude of the force!
    float strength = (G * mass * m.mass) / (d * d);

    // Putting magnitude and direction together!
    force.mult(strength);
    // Insted of attraction it repulses!
    force = new PVector(force.x * -1, force.y * -1);  

    return force;
  } 

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity = new PVector(constrain(velocity.x, -10, 10),constrain(velocity.y, -10, 10));  //stops big spreading
    acceleration = new PVector(0,0);
  }


  void display() {
    fill(255);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}