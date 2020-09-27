class Tile{  
  PImage img;
  PVector pos;
  int col, w, h;
  String type;
  Tile(int posx, int posy, int dimh, int dimw, String type){
    pos = new PVector(posx, posy);
    h = height / dimh;  //dependent on mapsize
    w = width / dimw;
    this.type = type;
    switch(type){
      case "END" : img = loadImage("/Textures/End_Goal.png"); break;
      default : break;
    }
  }
  
  boolean collisionDetect(float x, float y, int rad) {
    float closeX = x;
    float closeY = y;
    float dis = 0;  //distance
    String side = "";
    //--neightbours--//doesnt work jet (give neighbors over when creating wall)
    
    //Check left side of rect
    if (x < pos.x) {
      closeX = pos.x; 
      side += "left";
    }
    //Check right side of rect
    if (x > pos.x + w) {
      closeX = pos.x + w; 
      side += "right";
    }

    //Check top side of rect
    if (y < pos.y) {
      closeY = pos.y; 
      side += "top";
    }
    //Check bottom side of rect
    if (y > pos.y + h) {
      closeY = pos.y + h; 
      side += "bottom";
    }
    
    dis = dist(closeX, closeY, x, y);

    if (dis <= rad) return true;
    return false;     
  }
  
  void display(){
    image(img,pos.x, pos.y, w, h);
  }
}