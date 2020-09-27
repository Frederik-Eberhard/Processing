class Entity {
  int[] directions;               ///
  PVector pos, MPos, vel, dir;
  color Col;
  int size,stepcount;             ///
  boolean w,a,s,d,dead;


  Entity(PVector pos_, int size_) {
    directions = new int[400];    ///
    pos = new PVector();
    MPos = new PVector();
    vel = new PVector();
    dir = new PVector(0, 0);
    pos = pos_;
    Col = color(60,0,0);
    size = size_;
    w = false;
    a = false;
    s = false;
    d = false;
    dead = false;
  }
  
  void create_directions(){
    for(int i = 0; i < directions.length; i++){
      directions[i] = int(random(9));
    }
    stepcount = 200;
  }

  void update(boolean move) {
    if(!dead){
      if(move)
        movement();
      //--pos-to-MPos---------------
      MPos = getMapPos().add(pos);
    }else{
    }
  }

  void show() {
    fill(Col);
    ellipse(MPos.x, MPos.y, size, size);
    
    stroke(2);
    //line(MPos.x, MPos.y, dir.x+MPos.x, dir.y+MPos.y);
    //stroke(0);
  }

  void get_direction(int x, int y) {
    pushMatrix();
    translate(MPos.x,MPos.y);
    //--turning
    dir = new PVector(x, y);
    dir = dir.sub(MPos);
    dir.normalize();
    dir.setMag(updateDist);
    popMatrix();
  }

  void movement() {
    PVector  eDir = getMapPos().add(getPlayerPos());
    get_direction(int(eDir.x),int(eDir.y));
    dir.add(MPos);
    movement_setting();
    velUpdate();
    collisions();
    pos.add(vel);
    dir.sub(MPos);
  }

  void movement_input(char k, boolean b) {    //only for player
  }
  
  void movement_setting(){
    w = false;
    a = false;
    s = false;
    d = false;
    
    if(stepcount > 400) 
      stepcount = 0;
    switch(directions[stepcount]){
      case 0: w = true; break;
      case 1: a = true; break;
      case 2: s = true; break;
      case 3: d = true; break;
      case 4: w = true; d = true; break;
      case 5: d = true; s = true; break;
      case 6: s = true; a = true; break;
      case 7: a = true; w = true; break;
      case 8: break;
    }
    if(frameCount % int(random(200,400)) == 0){
      stepcount++;
    }
  }

  void velUpdate(){
      if(w && pos.y - size/2 > 0) vel.y = -pace;
      else if(s && pos.y + size/2 < arrSize*Msize) vel.y = pace;
      else vel.y = 0;
      if(a && pos.x - size/2 > 0) vel.x = -pace;
      else if(d && pos.x + size/2 < arrSize*Msize) vel.x = pace;
      else vel.x = 0;
  }

  void collisions(){
    for(int i = int(pos.x/Msize - (pos.x > 0? 1:0)); i < int(pos.x/Msize + (pos.x < (arrSize-1)*Msize ? 2:1)); i++){
      for(int j = int(pos.y/Msize - (pos.y > 0? 1:0)); j < int(pos.y/Msize + (pos.y < (arrSize-1)*Msize ? 2:1)); j++){  //only the 3*3 square around the Entity is checked
        int collision = MapCollisions(i,j,pos,size);       
        switch(collision){    //1 = left, 2 = right , 3 = top, 4 = bottom, 5 = lefttop, 6 = righttop, 7 = leftbottom, 8 = rightbottom
          case 1:  if(vel.x > 0){vel.x = 0;} break;
          case 2:  if(vel.x < 0){vel.x = 0;} break;
          case 3:  if(vel.y > 0){vel.y = 0;} break;
          case 4:  if(vel.y < 0){vel.y = 0;} break;
          case 5:  if(vel.x > 0 && vel.y > 0){vel.x = 0; vel.y = 0;} break;
          case 6:  if(vel.x < 0 && vel.y > 0){vel.x = 0; vel.y = 0;} break;
          case 7:  if(vel.x > 0 && vel.y < 0){vel.x = 0; vel.y = 0;} break;
          case 8:  if(vel.x < 0 && vel.y < 0){vel.x = 0; vel.y = 0;} break;
          default: break;
        }
      }
    }
  }
  
    
  boolean get_entity_dist(PVector ePos){
    return (dist(pos.x,pos.y,ePos.x,ePos.y) < Esize)? true:false;
  }
  
  void dead(){
    dead = true;
          Menu_active("Try Again");

  }
}