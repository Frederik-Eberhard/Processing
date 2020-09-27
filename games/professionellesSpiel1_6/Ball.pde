class Ball {
  PVector pos, vel, acc;
  int rad;
  boolean check = true;
  void setup() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(random(-5, 5), random(-5, 5));
    acc = new PVector(0.01,0.01);
    rad = height / 50;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);


    if (pos.x > width - rad || pos.x < 0 + rad) {
      vel.x *= -1;
      acc.x *= -1;
    }

    if (pos.y > height -rad || pos.y < 0 + rad) {
      vel.y *= -1;
      acc.y *= -1;
    }


    for (Balken p : players) {
      if (pos.x - rad <= p.pos.x + p.w/2 && pos.x + rad >= p.pos.x - p.w/2   &&   pos.y - rad <= p.pos.y + p.h/2 && pos.y + rad >= p.pos.y - p.h/2) {  //rechts/links/ check
        if (check == true) {
          vel.x *= -1;
          acc.x *= -1;
          check = false;
        }
      } else {
        check = true;
      }
    }
    if (pos.x < 0 + rad) {
      println("YOU FUCKED UP");
      explode(pos);
      s.addScore(0,1);
      reset();
    }
    if( pos.x > width - rad && number == 2) {
      println("YOU FUCKED UP");
      explode(pos);
      s.addScore(1,1);
      reset();    
    }
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, rad*2, rad*2);
  }
}