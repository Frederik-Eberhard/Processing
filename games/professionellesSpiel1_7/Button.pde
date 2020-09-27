class Button {
  String lable;
  PVector pos;
  int w, h, col;
  Button(String name, int hpos, int wid, int hei) {
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
    textSize(width/30);
    textAlign(CENTER, CENTER);
    text(lable, pos.x, pos.y);
  }

  void colorChange(String s) {
    if (s == "HOVER")
      col = 150;
    else
      col = 200;
  }

  void task() {
    if (lable == "START") {
      menu.hidden = true;
      start();
      println("start");
    } else if (lable == "PLAYERS : 1") {
      number = 2;
      lable = "PLAYERS : 2";
    } else if (lable == "PLAYERS : 2") {
      number = 1;
      lable = "PLAYERS : 1";
    } else if (lable == "MODE : Standard") {
      gamemode = 2;
      lable = "MODE : Mult-Ball";
      println("mode");
    } else if (lable == "MODE : Mult-Ball") {
      gamemode = 1;
      lable = "MODE : Standard";
      println("mode");      
    }
  }
}