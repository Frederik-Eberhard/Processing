class Player extends Entity{
  boolean w,a,s,d;
  
  Player(PVector pos_,int size_){
    super(pos_,size_);
    Col = color(200,200,0);
    w = false;
    a = false;
    s = false;
    d = false;
  }
  
  void show(){
    super.show();        
      dir.setMag(100);
      stroke(2);
      line(MPos.x, MPos.y, dir.x, dir.y);
      stroke(0);

  }
  
  void movement(){
    //println("VEL" + vel);
    get_direction(mouseX,mouseY);
    velUpdate();
    collisions();
    pos.add(vel);
  }
   
  //--seperate-functions-----------------
  void movement_input(char k, boolean b){
    //println("k" + k);
    if(b){
      switch(k){
        case 'w':  w = true; break;
        case 'a':  a = true; break;
        case 's':  s = true; break;
        case 'd':  d = true; break;
        default :  break;
      }
    }
    if(!b){
      switch(k){
        case 'w':  w = false; break;
        case 'a':  a = false; break;
        case 's':  s = false; break;
        case 'd':  d = false; break;
        default :  break;
      }
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
      for(int j = int(pos.y/Msize - (pos.x > 0? 1:0)); j < int(pos.y/Msize + (pos.y < (arrSize-1)*Msize ? 2:1)); j++){  //only the 3*3 square around the Entity is checked
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
}