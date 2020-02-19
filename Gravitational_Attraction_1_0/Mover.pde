class Mover {
  PVector location, velocity, acceleration;
  int mass;

  Mover() {
    location = new PVector(width/3, height/4);
    velocity = new PVector(5, 0);
    acceleration = new PVector(0, 0);
    mass = 4;
  }

  void applyForce(PVector force) {
    acceleration = force;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}