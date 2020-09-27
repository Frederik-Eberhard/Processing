class Weapon {
  Vector bullets;
  //Bullet b;
  PVector pos;                               //pos of wepon
  int rad, spe, len, timelastshoot;     //radius of weapon, speed of projectile, length of shotcone, damage of projectile
  float ang, cooldown;                       //angel of shotcone, cooldown till next shot
  Weapon(String type, int r) {
    bullets = new Vector();
    timelastshoot = 0;
    rad = r;
    switch(type) {
    case "REVOLVER" : 
      spe = width/120;
      ang = radians(45);
      len = 100;
      cooldown = 100;
      break;
    case "SNIPER" : 
      spe = width/100;
      ang = radians(5);
      len = width;
      cooldown = 1000;
      break;
    }
  }

  void shoot(PVector dir) {
    //println("timelastshoot " + timelastshoot);
    if (timelastshoot + cooldown < millis()) {
      bullets.add(new Bullet(pos, dir.rotate(random(-ang/2, ang/2)), spe, len));
      timelastshoot = millis();
    }
    //println(bullets.size());
  }

  void update(PVector position, PVector direction, boolean dead) {
    if(!dead){
      PVector posi = new PVector(position.x, position.y);
      PVector dire = new PVector(direction.x, direction.y);
      dire.setMag(rad);
      pos = posi.add(dire.rotate(HALF_PI));  //right side of body
    }
    for (int i = 0; i < bullets.size(); i++) {
      ((Bullet)bullets.elementAt(i)).update();
      if (((Bullet)bullets.elementAt(i)).dead == true) {
        bullets.remove(i);
      }
    }
  }

  void display() {
    strokeWeight(1);
    fill(200, 0, 0);
    ellipse(pos.x, pos.y, rad, rad);
    for (int i = 0; i < bullets.size(); i++) {
      ((Bullet)bullets.elementAt(i)).display();
    }
  }
}