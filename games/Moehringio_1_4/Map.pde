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
    int x = int(random(arrSize/5,arrSize)-1);
    int y = int(random(arrSize/5,arrSize)-1);
    println(x,y);
    Map[x-1][y-1] = new Goal("Goal1", new PVector((x-1)*Msize,(y-1)*Msize));
    Map[x][y-1]   = new Goal("Goal1", new PVector(x*Msize,(y-1)*Msize));
    Map[x+1][y-1] = new Goal("Goal1", new PVector((x+1)*Msize,(y-1)*Msize));
    Map[x-1][y]   = new Goal("Goal1", new PVector((x-1)*Msize,y*Msize));
    Map[x][y]     = new Goal("Goal1", new PVector(x*Msize,y*Msize));
    Map[x+1][y]   = new Goal("Goal1", new PVector((x+1)*Msize,y*Msize));
    Map[x-1][y+1] = new Goal("Goal1", new PVector((x-1)*Msize,(y+1)*Msize));
    Map[x][y+1]   = new Goal("Goal1", new PVector(x*Msize,(y+1)*Msize));
    Map[x+1][y+1] = new Goal("Goal1", new PVector((x+1)*Msize,(y+1)*Msize));
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
  
  /*
  boolean wallBetween(PVector a, PVector b){    //need to be pos, not MPos
    println("HALLO");
    Vector v = new Vector();
    v = getTilesBetween(a,b);
    
    println("size",v.size());                      ///
    for(int i = 0; i < v.size(); i++){
      println(i, " : ",(PVector)v.elementAt(i));   ///
      PVector p = (PVector)v.elementAt(i);
      if(Map[int(p.x)][int(p.y)] instanceof Wall)
        return true;
    }  
    
    println("size",v.size());
    for(int i = 0; i < v.size(); i++){
      println(i, " : ",(PVector)v.elementAt(i));
    }
    
    return false;
  }
  
  Vector  getTilesBetween(PVector a,PVector b){
    Vector v = new Vector();
    float dx = int(b.x - a.x)/Msize;              //distance x      !works onlyfor quadrant IV! 
    float dy = int(b.y - a.y)/Msize;              //distance y
    boolean sr = (dx > dy)?true:false;          //schnelle Richtung -> true = x, false = y
    float f = (sr)?dx/2:dy/2;                   //fehler
    
    PVector p = new PVector(int(a.x/Msize),int(a.y/Msize));  // /Msize for Tile index
    v.add(p);    
    
    println("dx",dx,"dy",dy,"sr",sr,"f",f,"p",p);
    
    for(int i = int((sr)?p.x:p.y); i < ((sr)?int(b.x/Msize):int(b.y/Msize)); i++){
      p = new PVector(p.x,p.y);
      p.add(new PVector((sr)?1:0,(sr)?0:1));                 //in schneller Richtung +1
      f -= (sr)? dy:dx;
      if(f < 0){
        p.add(new PVector((sr)?0:1,(sr)?1:0));
        f += (sr)?dx:dy;
      }
      v.add(p);
    }
    
    p = new PVector(int(b.x/Msize),int(b.y/Msize));
    v.add(p);
    
    println("size",v.size());
    for(int i = 0; i < v.size(); i++){
      println(i, " : ",(PVector)v.elementAt(i));
    }
    return v;
  }
  */
}