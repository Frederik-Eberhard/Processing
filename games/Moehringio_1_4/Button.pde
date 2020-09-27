class Button{
  String Text;
  PVector pos;
  int w,h;
  boolean hover,clicked;
  
  Button(String Text_, PVector pos_, int w_, int h_){
      pos = new PVector();
      Text = Text_;
      pos = pos_;
      w = w_;
      h = h_;
      hover = false;
      clicked = false;
  }
  
  void update(){
    int x = mouseX;
    int y = mouseY;
    if(x > pos.x - w/2 && x < pos.x + w/2 && y > pos.y - h/2 && y < pos.y + h/2){
      hover = true;
    }else{
      hover = false;
    }
    
    //println(hover,clicked);
    if(clicked)
      function();
  }
  
  void show(){
    int w_ = w;
    int h_ = h;
    if(hover){
      w_ *= 1.05;
      h_ *= 1.05;
    }
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(w_/7);
    fill(200);
    text(Text,pos.x,pos.y+h_/4);
    stroke(0,200,0,200);
    fill(0,200,0,100);
    rect(pos.x,pos.y,w_,h_,width/200);
    rectMode(CORNER);
  }
  
  void function(){
    switch(Text){
      case "Try Again": restart(); break;
      case "Next Level": nextLevel(); break;
      default: break;
    }
  }
  
  void pressed(){
    if(hover)
      clicked = true;
    println(clicked);
  }
}