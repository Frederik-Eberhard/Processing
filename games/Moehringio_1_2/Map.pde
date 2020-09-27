class Map{
  PVector pos,vel;
  Tile[][] Map;
  boolean w,a,s,d;
  
  Map(PVector pos_,int arrSize_){
    pos = new PVector();
    vel = new PVector();
    pos = pos_;
    Map = new Tile[arrSize_][arrSize_];
    w = false;
    a = false;
    s = false;
    d = false;
  }
  
  void create(){
    for(int i = 0; i < Map.length; i++){
      for(int j = 0; j < Map[0].length; j++){
        PVector Tpos = new PVector(i*Msize,j*Msize);
        int r = int(random(4));
        switch(r){
        case 0:  Map[i][j] = new Tile("Ground1",Tpos);    break;
        case 1:  Map[i][j] = new Tile("Ground2",Tpos);    break;
        case 2:  Map[i][j] = new Tile("Ground3",Tpos);    break;
        case 3:  Map[i][j] = new Wall("Wall1",Tpos);      break;
        default: break;
        }
      }
    }
  }
  
  void update(){
    velUpdate();
    pos.add(vel);
    //println(pos);
  }
  
  void show(){
    //println(int(pos.x/Msize) + " " + int(pos.y/Msize));
    for(int i = -int(pos.x/Msize); i < -int(pos.x/Msize) + width/Msize + (pos.x%Msize == 0? 0:1); i++){    //only add the extra tile,if it is necesary (for edges of the map)
      for(int j = -int(pos.y/Msize); j < -int(pos.y/Msize) + height/Msize + (pos.y%Msize == 0? 0:1); j++){
        Map[i][j].show(pos.x+i*Msize,pos.y+j*Msize,Msize);
      }
    }
  }
  
  
  //--seperate-functions-----------------
  void movement_input(char k, boolean b){
    //println(k);
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
    PVector Ppos = getPlayerPos();
    PVector Pvel = getPlayerVel();
    
    if(Pvel.x > 0 && Ppos.x > width/2 && pos.x - width > -arrSize*Msize || Pvel.x < 0 && Ppos.x < arrSize*Msize - width/2 && pos.x < 0){
      vel.x = -Pvel.x;
    }
    else{
      vel.x = 0;
    }
    if(Pvel.y > 0 && Ppos.y > height/2 && pos.y - height > -arrSize*Msize || Pvel.y < 0 && Ppos.y < arrSize*Msize - height/2 && pos.y < 0){
      vel.y = -Pvel.y;
    }
    else{
      vel.y = 0;
    }
  }
  
  int Collisions(int i, int j, PVector p, int s){    //pos, size
    boolean neighbours[] = new boolean[4];
    if(j > 0)         neighbours[0] = (Map[i][j-1] instanceof Wall)? true:false;
    if(i < arrSize-1) neighbours[1] = (Map[i+1][j] instanceof Wall)? true:false;
    if(j > arrSize-1) neighbours[2] = (Map[i][j+1] instanceof Wall)? true:false;
    if(i > 0)         neighbours[3] = (Map[i-1][j] instanceof Wall)? true:false;
    
    return (Map[i][j] instanceof Wall)? Map[i][j].CollisionDetection(p,s,neighbours) : 0;
  }
}