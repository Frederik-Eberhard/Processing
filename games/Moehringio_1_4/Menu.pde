class Menu{
  Button[] B;
  boolean visible;
  
  Menu(){
    B = new Button[1];
    for(int i = 0; i < B.length; i++){
      B[i] = new Button("Try Again", new PVector(width/2,height/2), width/4,height/12);
    }
    visible = false;
  }
  
  void update(){
    if(visible){
      for(int i = 0; i < B.length; i++){
        B[i].update();
      }
    }
  }
  
  void show(){
    if(visible){
      for(int i = 0; i < B.length; i++){
        B[i].show();
      }
    }
  }
  
  void activate(String Text_){
    B[0] = new Button(Text_, new PVector(width/2,height/2), width/4,height/12);
    visible = true;
  }
  
  void pressed(){
    for(int i = 0; i < B.length; i++){
      B[i].pressed();
    }
  }
}