class Enemy{
  Weapon w;
  Particle[] blood;
  PVector pos,vel,dir,acc,deadvel;
  int rad,pace;
  boolean dead,stop;
  Enemy(int x, int y, int pac, String wep){
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    dir = new PVector(1,0);
    acc = new PVector(0,0);
    deadvel = new PVector(0,0);  //ausgangs Geschwindikeit nachdem er tot ist
    //println(pos);
    
    pace = pac;
    rad = width / 110;
    dead = false;
    stop = false;
    w = new Weapon(wep, rad);
    blood = new Particle[3];
  }
  
  void update() {
    w.update(pos, dir,dead);  //weapon needs to be updated first to be able to shoot
    if(!dead){
      if(!stop){
        direction(int(p.pos.x), int(p.pos.y));
        movement();
        hit();
        shoot();
        //keyUpdate();
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
  }

  void shoot() {
    if(dist(p.pos.x,p.pos.y,pos.x,pos.y) < w.len && !p.dead){ //so that he doesnt continue shooting after youre dead
      w.shoot(dir);
    }
  }
  
  void hit(){
    for(int i = 0; i < p.w.bullets.size(); i++){
      if(dist(pos.x,pos.y,((Bullet)p.w.bullets.elementAt(i)).pos.x,((Bullet)p.w.bullets.elementAt(i)).pos.y) < rad+((Bullet)p.w.bullets.elementAt(i)).rad){
         //--Blood-&-Pushback----
         PVector buldir = new PVector(((Bullet)p.w.bullets.elementAt(i)).vel.x,((Bullet)p.w.bullets.elementAt(i)).vel.y);
         buldir.normalize();
         //println("buldir " + buldir);
         for(int j = 0; j < blood.length; j++){
           blood[j] = new Particle(pos.x,pos.y,buldir.x,buldir.y);
         }
         
         vel = new PVector(buldir.x,buldir.y);
         acc = new PVector(buldir.x,buldir.y);
         vel.mult(5);
         acc.mult(-.5);
         deadvel = new PVector(vel.x,vel.y);
         //println(" vel " + vel + "  acc " + acc);
         
         p.w.bullets.remove(i);
         dead = true;
         //println("HIT");
      }
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
      vel.x = 0;
    }
    if ((pos.y <= rad && vel.y < 0)||(pos.y >= height - rad && vel.y > 0)) {
      vel.y = 0;
    }
    
    //--Walldetection--
    for(int i = 0; i < walls.size(); i++){
      int a = (((Wall)walls.elementAt(i)).collisionDetect(pos.x,pos.y,rad));  //right check
      switch(a){  //1 = left, 2 = right , 3 = top, 4 = bottom, 5 = lefttop, 6 = righttop, 7 = leftbottom, 8 = rightbottom
        //--edges--
        case 1:  if(vel.x > 0){vel.x = 0;}break;
        case 2:  if(vel.x < 0){vel.x = 0;}break;
        case 3:  if(vel.y > 0){vel.y = 0;}break;
        case 4:  if(vel.y < 0){vel.y = 0;}break;
        //--corners--
        case 5:  if(vel.x > 0 && vel.y > 0){vel.x = 0;vel.y = 0;}break;
        case 6:  if(vel.x < 0 && vel.y > 0){vel.x = 0;vel.y = 0;}break;
        case 7:  if(vel.x > 0 && vel.y < 0){vel.x = 0;vel.y = 0;}break;
        case 8:  if(vel.x < 0 && vel.y < 0){vel.x = 0;vel.y = 0;}break;

        default: break;
      }
    }
    
    //--Vector-adding--
    vel.add(acc);  //acc only for pushback
    pos.add(vel);
    
    if(dead){
      if(deadvel.x > 0 && vel.x < 0){
        if(deadvel.y > 0 && vel.y < 0){stop = true;}
        else if(deadvel.y < 0 && vel.y > 0){stop = true;}
      }else if (deadvel.x < 0 && vel.x > 0){
        if(deadvel.y > 0 && vel.y < 0){stop = true;}
        else if(deadvel.y < 0 && vel.y > 0){stop = true;}
      }
    }  
  }  

  void display() {
    fill(150,50,50);
    noStroke();
    ellipse(pos.x, pos.y, rad*2, rad*2);
    stroke(2);                                           //display purposes
    dir.setMag(100);                                     //display purposes
    //line(pos.x, pos.y, pos.x + dir.x, pos.y + dir.y);  //display purposes
    w.display();
    if(dead){
      for(int i = 0; i < blood.length; i++){
        blood[i].display();      
      }
    }
  }
}
