class Button {
  PVector pos;
  int w, h, tempw, temph;
  String Lable;
  boolean hover;
  Button(PVector position, int wid, int hei, String Text) {
    pos = new PVector(position.x, position.y);
    w = wid;
    h = hei;
    Lable = Text;
  }
  
  void update(){
    if (mouseX > pos.x - w/2 && mouseX < pos.x + w/2 && mouseY > pos.y - h/2 && mouseY < pos.y + h/2)
      hover = true;
    else 
      hover = false;
  }

  void click() {
    if(hover){
      println("CLICK: " + Lable);
      m.retry = true;
    }
  }

  void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    if(hover){
      fill(150, 50, 50, m.alpha);
      stroke(70,m.alpha + (255 - m.MAXALPHA));
      tempw = w + width/80;
      temph = h + height/80;
    }
    else{
      fill(50, 0, 0, m.alpha);
      stroke(30,m.alpha + (255 - m.MAXALPHA));
      tempw = w;
      temph = h;
    }
    strokeWeight(2);
    rect(pos.x, pos.y, tempw, temph, 6);
    fill(0);
    textSize(temph/6*5);
    text(Lable, pos.x, pos.y - w/25);
  }
}