class Ball{
  float x,y;
  float xspeed,yspeed;
  
  Ball(){
    x = width/2;
    y = height/2;
    xspeed = 2.5;
    yspeed = -2;
  }
  
  void move(){
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void bounce(){
    if((x > width)||(x < 0)){
      xspeed = xspeed * -1;
    }
    if((y > height)||(y < 0)){
      yspeed = yspeed * -1;
    }
  }
  
  void display(){
    fill(0);
    ellipse(x,y,40,40);
  }
}