class Tile {
  PVector pos;
  String TileType;
  color C;

  Tile(String TileType_, PVector pos_) {
    TileType = TileType_;
    pos = new PVector(pos_.x, pos_.y);

    switch(TileType) {
    case "Ground1":  
      C = color(255, 0, 0);
      C = color(60);
      break;
    case "Ground2":  
      C = color(0, 255, 0);  
      C = color(65);
      break;
    case "Ground3":  
      C = color(0, 0, 255);
      C = color(70);
      break;
    case "Wall1"  :  
      C = color(0, 0, 0);
      C = color(0);
      break;
    default:  
      break;
    }
  }

  void update() {
  }


  void show(float x, float y, int size) {
    fill(C);
    noStroke();
    rect(x, y, size, size);
  }



  int CollisionDetection(PVector Ppos, int rad, boolean[] neighbours) {
    PVector closest = new PVector(Ppos.x, Ppos.y);
    String Side = "";
    float dis = 0;

    if (Ppos.x < pos.x) {
      closest.x = pos.x;
      Side += "left";
    }
    if (Ppos.x > pos.x + Msize) {
      closest.x = pos.x + Msize;
      Side += "right";
    }
    if (Ppos.y < pos.y) {
      closest.y = pos.y;
      Side += "top";
    }
    if (Ppos.y >   pos.y + Msize) {
      closest.y = pos.y + Msize;
      Side += "bottom";
    }
    
    if (Side.equals("lefttop")) {
      if (neighbours[0] == true) Side = "left";
      if (neighbours[3] == true) Side = "top";
    }
    if (Side.equals("righttop")) {
      if (neighbours[0] == true) Side = "right";
      if (neighbours[1] == true) Side = "top";
    }
    if (Side.equals("leftbottom")) {
      if (neighbours[2] == true) Side = "left";
      if (neighbours[3] == true) Side = "bottom";
    }
    if (Side.equals("rightbottom")) {
      if (neighbours[2] == true) Side = "right";
      if (neighbours[1] == true) Side = "bottom";
    }

    dis = dist(closest.x, closest.y, Ppos.x, Ppos.y);
    if (dis <= rad/2) {
      //C = color(255);
      switch(Side) {    //1 = left, 2 = right , 3 = top, 4 = bottom, 5 = lefttop, 6 = righttop, 7 = leftbottom, 8 = rightbottom
      case "left"       : return 1;
      case "right"      : return 2;
      case "top"        : return 3;
      case "bottom"     : return 4;
      case "lefttop"    : return 5;
      case "righttop"   : return 6;
      case "leftbottom" : return 7;
      case "rightbottom": return 8;
      }
      return 9; //inside
    } else
      //C = color(0);
    // println("side: " + Side + "  dist: " + dis);
    return 0;  //0 = no collision
  }
}