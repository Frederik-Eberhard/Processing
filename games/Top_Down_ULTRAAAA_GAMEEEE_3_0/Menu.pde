class Menu{
  Button[] buttons;  //incase of wanting multiple buttons
  PVector pos,tcol;
  int w,h;
  float alpha;
  boolean retry,victory;
  String Text;
  final int bhei = height/8, bwid = width/5, bgapy = height/40, bgapx = width/100;
  final float fadeamount = 5.5;
  final float MAXALPHA = 100;

  Menu(){
    buttons = new Button[1];
    pos = new PVector(width/2,height/2);
    tcol = new PVector(255,0,0);
    w = width/4;
    h = height/4;
    alpha = 0;
    retry = false;
    Text = "";
    victory = false;
    buttons[0] = new Button(new PVector(pos.x,pos.y),bwid,bhei,"RETRY");
  }
  
  void update(){
    if(alpha < MAXALPHA)
      alpha += fadeamount;
    for(int i = 0; i < buttons.length; i++){
      buttons[i].update();
    }
    if(victory) {Text = "VICTORY"; tcol = new PVector(0,255,0);}
    else {Text = "YOU DIED";tcol = new PVector(255,0,0);}
  }
  
  void display(){
    rectMode(CENTER);
    textAlign(CENTER);
    fill(100,0,0,alpha);
    stroke(30,alpha + (255 - MAXALPHA));
    strokeWeight(2);
    rect(pos.x,pos.y,w,h,6);
    fill(tcol.x,tcol.y,tcol.z,200);
    textSize(width/6);
    text(Text,pos.x,pos.y - h/2 - h/15);// - bhei/2 - bgapy);
    for(int i = 0; i < buttons.length; i++){
      buttons[i].display();
    }
  }
}