class Player {
  Weapon w;
  Particle[] blood;
  PVector pos, vel, acc, dir, deadvel;
  int rad, pace;
  boolean keyw, keya, keys, keyd, dead, stop, next;
  Player(int x,int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dir = new PVector(0, 0);
    deadvel = new PVector(0,0);
    rad = width / 110;
    pace = 4;
    keyw = false;
    keya = false;
    keys = false;
    keyd = false;
    next = false;
    w = new Weapon("REVOLVER", rad);
    blood = new Particle[3];
  }

  void update() {
    if(!dead){
      if(!stop){
        direction(mouseX, mouseY);
        movement();
        hit();
        if(!dead){
          keyUpdate();
        }
      }
    }
    else{
      for(int i = 0; i < blood.length; i++){
        blood[i].update();      
      }
      if(!stop){
        movement();
      }
    }
    w.update(pos, dir,dead);
  }

  void shoot() {
    if(!dead){
      w.shoot(dir);
    }
  }
  
  void direction(int x, int y) {
    //--turning
    dir = new PVector(x, y);
    dir = dir.sub(pos);
    dir.normalize();
  }

  void movement() {
    //--Borderdetection--
    if ((pos.x <= rad && vel.x < 0)||(pos.x >= width - rad && vel.x > 0)) {
      acc.x = 0;
      vel.x = 0;
    }
    if ((pos.y <= rad && vel.y < 0)||(pos.y >= height - rad && vel.y > 0)) {
      acc.y = 0;
      vel.y = 0;
    }
    
    //--Walldetection--
    for(int i = 0; i < walls.size(); i++){
      int a = (((Wall)walls.elementAt(i)).collisionDetect(pos.x,pos.y,rad));  //right check
      switch(a){  //1 = left, 2 = right , 3 = top, 4 = bottom, 5 = lefttop, 6 = righttop, 7 = leftbottom, 8 = rightbottom
        //--edges--
        case 1:  if(vel.x > 0){acc.x = 0;vel.x = 0;}break;
        case 2:  if(vel.x < 0){acc.x = 0;vel.x = 0;}break;
        case 3:  if(vel.y > 0){acc.y = 0;vel.y = 0;}break;
        case 4:  if(vel.y < 0){acc.y = 0;vel.y = 0;}break;
        //--corners--
        case 5:  if(vel.x > 0 && vel.y > 0){acc.x = 0;vel.x = 0;acc.y = 0;vel.y = 0;}break;
        case 6:  if(vel.x < 0 && vel.y > 0){acc.x = 0;vel.x = 0;acc.y = 0;vel.y = 0;}break;
        case 7:  if(vel.x > 0 && vel.y < 0){acc.x = 0;vel.x = 0;acc.y = 0;vel.y = 0;}break;
        case 8:  if(vel.x < 0 && vel.y < 0){acc.x = 0;vel.x = 0;acc.y = 0;vel.y = 0;}break;

        default: break;
      }
    }
    
    //--Tiledetection--
    for(int i = 0; i < tiles.size(); i++){
      boolean a = (((Tile)tiles.elementAt(i)).collisionDetect(pos.x,pos.y,rad)); 
      if(a){next = true;}
    }
    //--Vector-adding--
    vel.add(acc);
    pos.add(vel);
    
    if(dead){
      if(deadvel.x > 0 && vel.x <= 0){
        if(deadvel.y > 0 && vel.y <= 0){stop = true;}
        else if(deadvel.y < 0 && vel.y >= 0){stop = true;}
      }else if (deadvel.x < 0 && vel.x >= 0){
        if(deadvel.y > 0 && vel.y <= 0){stop = true;}
        else if(deadvel.y < 0 && vel.y >= 0){stop = true;}
      }
    }
    if(stop) menu = true;
    println("menu " + menu + " stop " + stop);
  }
  
  void hit(){
    for(int i = 0; i < enemys.size(); i++){
      for(int j = 0; j < ((Enemy)enemys.elementAt(i)).w.bullets.size(); j++){
        
        if(dist(pos.x, pos.y, ((Bullet)((Enemy)enemys.elementAt(i)).w.bullets.elementAt(j)).pos.x, ((Bullet)((Enemy)enemys.elementAt(i)).w.bullets.elementAt(j)).pos.y) < rad + ((Bullet)((Enemy)enemys.elementAt(i)).w.bullets.elementAt(j)).rad){  //collision
          
          //--Blood-&-Pushback----
          PVector buldir = new PVector(((Bullet)((Enemy)enemys.elementAt(i)).w.bullets.elementAt(j)).vel.x, ((Bullet)((Enemy)enemys.elementAt(i)).w.bullets.elementAt(j)).vel.y);
          buldir.normalize();
          for(int ij = 0; ij < blood.length; ij++){
            blood[ij] = new Particle(pos.x,pos.y,buldir.x,buldir.y);
          }
          vel = new PVector(buldir.x,buldir.y);
          acc = new PVector(buldir.x,buldir.y);
          vel.mult(5);
          acc.mult(-.5);
          deadvel = new PVector(vel.x,vel.y);
          ((Enemy)enemys.elementAt(i)).w.bullets.remove(j);
          dead = true;
        }   
      }
    }
  }

  void display() {
    fill(50);
    noStroke();
    ellipse(pos.x, pos.y, rad*2, rad*2);
    stroke(2);                                         //display purposes
    dir.setMag(100);                                   //display purposes
    //line(pos.x, pos.y, pos.x + dir.x, pos.y + dir.y);  //display purposes
    w.display();
    if(dead){
      for(int i = 0; i < blood.length; i++){
        blood[i].display();      
      }
    }
  }

  void keyUpdate(){  //needed for not sticking to walls
    if(keyw) vel.y = -pace;
    else if(keys) vel.y = pace;
    else vel.y = 0;
    if(keya) vel.x = -pace;
    else if(keyd) vel.x = pace;
    else vel.x = 0;
  }

  void press(char c) {
    if (c == 'w') {
      keyw = true;
    }
    if (c == 'a') {
      keya = true;
    }
    if (c == 's') {
      keys = true;
    }
    if (c == 'd') {
      keyd = true;
    }
  }
  void release(char c) {
    if (c == 'w'){// && vel.y == -pace) {
      keyw = false;
    }
    if (c == 'a'){// && vel.x == -pace) {
      keya = false;
    }
    if (c == 's'){// && vel.y == pace) {
      keys = false;
    }
    if (c == 'd'){// && vel.x == pace) {
      keyd = false;
    }
  }
}