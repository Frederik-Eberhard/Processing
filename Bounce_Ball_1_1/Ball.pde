class Ball{
  PVector location;
  PVector velocity;
  
  //float x,y;
  //float xspeed,yspeed;
  
  Ball(){
    location = new PVector(width/2,height/2);
    velocity = new PVector(12.5,-2);
    //x = width/2;
    //y = height/2;
    //xspeed = 2.5;
    //yspeed = -2;
  }
  
  void move(){
    location.add(velocity);
    
    //x = x + xspeed;
    //y = y + yspeed;
  }
  
  void bounce(){
    /*if((x > width)||(x < 0)){
      xspeed = xspeed * -1;
    }
    if((y > height)||(y < 0)){
      yspeed = yspeed * -1;
    }*/
    if ((location.x > width)||(location.x < 0)){
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height)||(location.y < 0)){
      velocity.y = velocity.y * -1;
    }
  }
  
  void display(){
    fill(0);
    ellipse(location.x,location.y,40,40);
  }
}