class Bullet{
  PVector pos,vel,oldpos;
  int spe, len, rad;
  boolean dead,wall;
  Bullet(PVector position, PVector direction, int speed, int lengt){  //length ist ein preset
    pos = new PVector(position.x,position.y);
    oldpos = new PVector(pos.x,pos.y);
    vel = new PVector(direction.x,direction.y);
    spe = speed;
    vel = vel.setMag(spe);
    len = lengt;
    rad = width/130;
    dead = false;
    wall = false;
    //println("NEW");
  }
  
  void update(){
    pos.add(vel);
    for(int i = 0; i < walls.size(); i++){
      if(((Wall)walls.elementAt(i)).collisionDetect(pos.x,pos.y,rad) != 0){  //if(collision)
        wall = true;
      }
    }
    if(dist(pos.x,pos.y,oldpos.x,oldpos.y) > len || wall){
      dead = true;
      //println("dead");
    }
  }
  
  void display(){
    fill(0,0,255);
    ellipse(pos.x,pos.y,rad,rad);
  }
}
