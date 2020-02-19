class Mover {
  PVector location, velocity, acceleration;
  int mass;

  Mover() {
    //location = new PVector(width/3, height/4);
    location = new PVector(random(width),random(height));
    velocity = new PVector(5, 0);
    acceleration = new PVector(0, 0);
    mass = int(random(3,6));
  }

  void applyForce(PVector force) {
    acceleration = force;
  }

  void update() {
    velocity.add(acceleration);
    velocity = new PVector(constrain(velocity.x, -10, 10),constrain(velocity.y, -10, 10)); //stops big spreading
    location.add(velocity);
  }

  void display() {
    fill(255);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}