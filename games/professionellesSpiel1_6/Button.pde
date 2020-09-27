class Button {
  String lable;
  PVector pos;
  int w, h, col;
  Button(String name,int hpos, int wid, int hei) {
    lable = name;
    w = wid;
    h = hei;
    col = 200;
    pos = new PVector(width/2, hpos);
    rectMode(CENTER);
  }

  void display() {
    fill(col);
    rect(pos.x, pos.y, w, h);
    fill(20);
    textSize(20);
    textAlign(CENTER,CENTER);
    text(lable, pos.x, pos.y);
  }
  
  void colorChange(String s){
    if(s == "HOVER")
      col = 150;
    else
      col = 200;
  }
  
  void task(){
    if(lable == "START"){
      menu.hidden = true;
      println("start");
    } else if(lable == "PLAYERS"){
      println("players");
    } else if(lable == "MODE"){
      println("mode");
    }
  }
}