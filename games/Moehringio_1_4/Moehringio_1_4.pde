import java.util.Vector;

Menu Menu;
Map M;
Entities E;
int Msize, Esize, arrSize, entSize, updateDist;
float pace;


void setup(){
  //size(480,270);
  fullScreen();
  Msize = width/32;           //1920 / x = 60
  Esize = width/48;           //1920 / x = 40
  arrSize = 100;
  entSize = 100;
  updateDist = width/2;//round(width/2.4);      //1920 / x = 100   
  pace = width/192;           //dynamic size and pace
  restart();
}

void draw(){
  M.update();
  E.update();
  Menu.update();
  
  M.show();
  E.show();
  Menu.show();
  fill(0);
  //text(frameRate,200,200);
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

void Menu_active(String Text_){
  Menu.activate(Text_);
}

void restart(){
  Menu = new Menu();
  M = new Map(new PVector(0,0),arrSize);
  E = new Entities(Esize);
  M.create();
}

void nextLevel(){
  entSize += 50;
  Menu = new Menu();
  M = new Map(new PVector(0,0),arrSize);
  E = new Entities(Esize);
  M.create();
}

void keyPressed(){
  E.movement_input(key,true);
  M.movement_input(key,true);
}

void keyReleased(){
  E.movement_input(key,false);
  M.movement_input(key,false);
}

void mousePressed(){
  Menu.pressed();
}