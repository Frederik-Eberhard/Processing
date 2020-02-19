class Boid{
  PVector pos, vel;
  float radius, size;
  
  Boid(PVector pos_, PVector vel_,  float radius_, float size_){
    pos = pos_;
    vel = vel_;
    radius = radius_;
    size = size_;
    println("New Boid" + pos + "  " + vel + "  " + radius + "  " + size);
  }
   
  void move(){
    pos.add(vel);
    if(pos.x > width + size){
      pos.x = -size;
    }else if(pos.x < -size){
      pos.x = width + size;
    }
    if(pos.y > height + size){
      pos.y = -size;
    }else if(pos.y < -size){
      pos.y = height + size;
    }    
  }
  
  void show(){
    PVector p = new PVector(vel.x,vel.y);
    p.normalize();
    p.mult(size);
    PVector p1 = new PVector(p.x,p.y);
    p1.mult(2);
    p.rotate(PI/3*2);
    PVector p2 = new PVector(p.x,p.y);
    p.rotate(PI/3*2);
    stroke(255);
    triangle(pos.x + p1.x, pos.y + p1.y, pos.x + p2.x, pos.y + p2.y, pos.x + p.x, pos.y + p.y);   
  }
}