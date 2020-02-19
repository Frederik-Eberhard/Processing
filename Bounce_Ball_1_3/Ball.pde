class Ball{
  int r,g,b;
  int re,gr,bl;
  
  float tx,ty; 
  float nx,ny;
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  
  Ball(){
    r = 1;
    g = 100;
    b = 200;
    
    re = 1;
    gr = 1;
    bl = 1;
    
    tx = 0;
    ty = 0;
  
    nx = 0;
    ny = 0;
    
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,2);
    acceleration = new PVector(0.01,0);
  }
  
  void move(){
    tx += 0.01;
    ty += 0.02;
    //nx = noise(tx);  //Doesn't work with perlin noise; All Balls are on top of each other
    //ny = noise(ty);
    nx = random(0,1);
    ny = random(0,1);
    nx = map(nx,0,1,-0.5,0.5);
    ny = map(ny,0,1,-0.5,0.5);
    acceleration.x += nx;
    acceleration.y += ny;
    acceleration.limit(10);
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
  }
   
  void bounce(){
    if (location.x > width) location.x = 0;
    if (location.x < 0) location.x = width;
    if (location.y > height) location.y = 0;
    if (location.y < 0) location.y = height;
  }
  
  void display(){
    fill(r,g,b);
    ellipse(location.x,location.y,40,40);
  }
  
  void tint(int a){
    if(r == 255 || r == 0){
      re = re * -1;  
    }
    if(g == 255 || g == 0){
      gr = gr * -1;  
    }
    if(b == 255 || b == 0){
      bl = bl * -1;  
    }
    r = r + re;
    g = g + gr;
    b = b + bl;
    //println("r ist gleich " + r);
    //println("g ist gleich " + g);
    //println("b ist gleich " + b);
  }
}