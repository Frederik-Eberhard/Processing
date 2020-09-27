class particle {
  PVector pos, vel, acc;
  int size, life;

  void setup(PVector loc) {
    size = int(random(3, 5));
    life = int(random(50, 100));
    pos = new PVector(loc.x + random(-3, 3), loc.y + random(-3, 3));
    if (pos.x < width/2) {
      vel = new PVector(random(0, 1), random(-1, 1));
      acc = new PVector(random(-0.05, -0.01), random(-0.05, -0.01));
    } else {
      vel = new PVector(random(-1, 0), random(-1, 1));
      acc = new PVector(random(0.05, 0.01), random(-0.05, -0.01));
    }
    vel.setMag(random(0.5)+5);
  }

  void update() {
    pos.add(vel);
    vel.add(acc);
    this.life--;
    if (life < 1) {  // if dead
      dead++;
      //println("dead " + dead);
    }
  }

  void display() {
    fill(255 - map(life, 70, 0, 0, 255));  //maps life to brightness
    ellipse(pos.x, pos.y, size, size);
  }
}
