class Ray{
  PVector pos, dir;
  
  Ray(PVector pos_, PVector dir_){
    pos = pos_;
    dir = dir_;
  }
  
  color getColor(Object o){
    color c = color(0,255,0);
    if(intersects(o)){
      c = color(255,0,0);
    }
    return c;
  }
  
  boolean intersects(Object o){
    float a    = -((pos.x - o.pos.x)*dir.x+(pos.y-o.pos.y)*dir.y+(pos.z-o.pos.z)*dir.z) / (pow(dir.x,2) + pow(dir.y,2) + pow(dir.z,2));
    float dist = sqrt(pow(pos.x + a * dir.x - o.pos.x,2) + pow(pos.y + a * dir.y - o.pos.y,2) + pow(pos.z + a * dir.z - o.pos.z,2));   
    PVector intersectPoint = new PVector(0,0,0);
    intersectPoint = pos;
    intersectPoint.add(dir.mult(a - sqrt(pow(o.rad,2) - pow(dist,2))));
    return dist <= o.rad;
//    return intersectPoint;
  }
}
