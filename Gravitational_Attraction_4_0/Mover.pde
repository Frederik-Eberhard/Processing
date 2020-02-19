class Mover {
  PVector location, velocity, acceleration;
  int mass;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(5, 0);
    acceleration = new PVector(0, 0);
    mass = 4;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity = new PVector(constrain(velocity.x, -30, 30),constrain(velocity.y, -30, 30));  //stops big spreading
    location.add(velocity);
    acceleration = new PVector(0,0);
  }

  void display() {
    fill(255);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}