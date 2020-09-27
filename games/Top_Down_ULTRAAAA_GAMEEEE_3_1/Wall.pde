class Wall {
  PImage img;
  PVector pos;
  int col, w, h;
  boolean[] neighbours;  //neightbouring walls
  Wall(int posx, int posy, int dimh, int dimw, int mode, boolean[] nei) {
    pos = new PVector(posx, posy);
    h = height / dimh;  //dependent on mapsize
    w = width / dimw;  
    neighbours = new boolean[4];
    neighbours = nei;
    getTexture();
    switch(mode) {
    case 2: 
      col = 100;
      break;
    }
  }

  void getTexture(){
    String direct = "";
    if(neighbours[0] == true){direct += "up";}  //up
    if(neighbours[1] == true){direct += "ri";}  //right
    if(neighbours[2] == true){direct += "do";}  //down
    if(neighbours[3] == true){direct += "le";}  //left
    switch(direct){
      case "up":  img = loadImage("Textures/Wallpart_07.png"); break;    //07
      case "ri":  img = loadImage("Textures/Wallpart_05.png"); break;    //05
      case "do":  img = loadImage("Textures/Wallpart_06.png"); break;    //06
      case "le":  img = loadImage("Textures/Wallpart_04.png"); break;    //04
      case "upri":  img = loadImage("Textures/Wallpart_11.png"); break;  //11
      case "updo":  img = loadImage("Textures/Wallpart_03.png"); break;  //03
      case "uple":  img = loadImage("Textures/Wallpart_10.png"); break;  //10
      case "dole":  img = loadImage("Textures/Wallpart_08.png"); break;  //08
      case "rido":  img = loadImage("Textures/Wallpart_09.png"); break;  //09
      case "rile":  img = loadImage("Textures/Wallpart_02.png"); break;  //02
      case "updole":  img = loadImage("Textures/Wallpart_12.png"); break;  //12
      case "uprido":  img = loadImage("Textures/Wallpart_13.png"); break;  //13
      case "uprile":  img = loadImage("Textures/Wallpart_14.png"); break;  //14
      case "ridole":  img = loadImage("Textures/Wallpart_15.png"); break;  //15
      case "upridole":  img = loadImage("Textures/Wallpart_16.png"); break;  //16
      default  :  img = loadImage("Textures/Wallpart_01.png"); break;  //01
    }
  }

  int collisionDetect(float x, float y, int rad) {
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

    //fill(255, 0, 0);
    //ellipse(closeX, closeY, 10, 10);

    dis = dist(closeX, closeY, x, y);
    //println(side);

    if (side.equals("lefttop")) {
      if (neighbours[0] == true) side = "left";
      if (neighbours[3] == true) side = "top";
    }
    if (side.equals("righttop")) {
      if (neighbours[0] == true) side = "right";
      if (neighbours[1] == true) side = "top";
    }
    if (side.equals("leftbottom")) {
      if (neighbours[2] == true) side = "left";
      if (neighbours[3] == true) side = "bottom";
    }
    if (side.equals("rightbottom")) {
      if (neighbours[2] == true) side = "right";
      if (neighbours[1] == true) side = "bottom";
    }

    if (dis <= rad) {  
      switch(side) {    //1 = left, 2 = right , 3 = top, 4 = bottom, 5 = lefttop, 6 = righttop, 7 = leftbottom, 8 = rightbottom
      case "left"       : 
        return 1;
      case "right"      : 
        return 2;
      case "top"        : 
        return 3;
      case "bottom"     : 
        return 4;
      case "lefttop"    : 
        return 5;
      case "righttop"   : 
        return 6;
      case "leftbottom" : 
        return 7;
      case "rightbottom": 
        return 8;
      }
      return 9; //inside
    }
    return 0;  //0 = no collision
  }

  void display() {
    noStroke();
    //fill(col);
    //rect(pos.x, pos.y, w, h);
    image(img,pos.x, pos.y, w, h);
  }
}
