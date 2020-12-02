class Ray{
  PVector pos, dir;
  
  Ray(PVector pos_, PVector dir_){
    pos = pos_;
    dir = dir_;
  }
    
  PVector intersects(Object o, PVector close){
    float a    = -((pos.x - o.pos.x)*dir.x+(pos.y-o.pos.y)*dir.y+(pos.z-o.pos.z)*dir.z) / (pow(dir.x,2) + pow(dir.y,2) + pow(dir.z,2));
    float dist = sqrt(pow(pos.x + a * dir.x - o.pos.x,2) + pow(pos.y + a * dir.y - o.pos.y,2) + pow(pos.z + a * dir.z - o.pos.z,2));   
    PVector intersectPoint = null;
    if(dist <= o.rad && a > 0){    //only initiallise intersectPoint if intersecting object
      PVector dir_ = new PVector(dir.x,dir.y,dir.z);      //to not change dir
      intersectPoint = new PVector(pos.x,pos.y,pos.z);    //to not change pos
      intersectPoint.add(dir_.mult(a - sqrt(pow(o.rad,2) - pow(dist,2))));
  }
//    return dist <= o.rad;
    return intersectPoint;
  }
}
