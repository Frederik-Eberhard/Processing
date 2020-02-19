class Site{
  PVector pos;
  Site(int x, int y){
    pos = new PVector(x,y);
  }
  
  void display(){
    noStroke();
    fill(110,110,255);
    ellipse(pos.x,pos.y,10,10);
  }
}