class Particle {
  PVector pos, vel, dir, acc;
  boolean stop;
  int rad;
  Particle(float x, float y, float dirx, float diry) {
    //println(dirx + " " + diry);
    pos = new PVector(x, y);
    dir = new PVector(dirx, diry);
    dir.rotate(random(radians(-45), radians(45)));
    vel = new PVector(dir.x, dir.y);
    vel.mult(4);
    acc = new PVector(dir.x, dir.y);
    acc.mult(-.1);
    //println("pos " + pos + "  vel " + vel + "  acc " + acc + "  dir " + dir);
    stop = false;
    rad = width/130;
  }

  void update() {
    if (!stop) {
      vel.add(acc);
      pos.add(vel);
      if (vel.x < 1 && vel.x > -1 && vel.y < 1 && vel.y > -1) {  //maybe not the best solution but mehh
        stop = true;
      }
    }
  }

  void display() {
    fill(0, 255, 0);
    ellipse(pos.x, pos.y, rad, rad);
  }
}