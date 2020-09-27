import java.util.Vector;

Map M;
Entities E;
int Msize, Esize, arrSize;
float pace;


void setup(){
  size(480,270);
  //fullScreen();
  Msize = width/32;     //1920 / x = 60
  Esize = width/48;           //1920 / x = 40
  arrSize = 100;
  pace = width/192;    //dynamic size and pace
  M = new Map(new PVector(0,0),arrSize);
  E = new Entities(Esize);
  M.create();
  
}

void draw(){
  M.update();
  E.update();
  
  M.show();
  E.show();

  fill(0);
  text(frameRate,200,200);
}

PVector getMapPos(){
  return new PVector(M.pos.x,M.pos.y);
}
PVector getPlayerPos(){
  return E.getPlayerPos();
}
PVector getPlayerVel(){
  return E.getPlayerVel();
}
int MapCollisions(int i, int j, PVector p, int s){
  return M.Collisions(i,j,p,s);
}


void keyPressed(){
  E.movement_input(key,true);
  M.movement_input(key,true);
}

void keyReleased(){
  E.movement_input(key,false);
  M.movement_input(key,false);
}