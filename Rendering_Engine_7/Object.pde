class Object {
  PVector pos,rot;
  float rad;
  String kind;

  Object(PVector pos_, float rad_) {    //Sphere
    pos = pos_;
    rad = rad_;
    kind = "Sphere";
  }
  Object(PVector pos_, float rad_, PVector rot_) {  //Plane
    pos = pos_;
    rad = rad_; 
    rot = rot_;//.normalize();
    kind = "Plane";
  }
  
  void updatePos(PVector pos_) {
    pos = pos_;
  }
  
  void updateRot(PVector rot_){
    rot = rot_;
  }

  PVector intersects(Ray r) {    //position and direction of ray
    switch(kind){
      case "Sphere": return intersectsSphere(r); 
      case "Plane" : return intersectsPlane(r);  
      default: break;
    }
    return null;
  }
  
  PVector intersectsSphere(Ray r){
    float a    = -((r.pos.x - pos.x)*r.dir.x+(r.pos.y-pos.y)*r.dir.y+(r.pos.z-pos.z)*r.dir.z) / (pow(r.dir.x, 2) + pow(r.dir.y, 2) + pow(r.dir.z, 2));
    float dist = sqrt(pow(r.pos.x + a * r.dir.x - pos.x, 2) + pow(r.pos.y + a * r.dir.y - pos.y, 2) + pow(r.pos.z + a * r.dir.z - pos.z, 2));   
    PVector intersectPoint = null;
    if (dist <= rad && a > 0) {    //only initiallise intersectPoint if intersecting object
      PVector d_ = new PVector(r.dir.x, r.dir.y, r.dir.z);      //to not change dir
      intersectPoint = new PVector(r.pos.x, r.pos.y, r.pos.z);    //to not change pos
      intersectPoint.add(d_.mult(a - sqrt(pow(rad, 2) - pow(dist, 2))));
    }
    //    return dist <= o.rad;
    return intersectPoint;
  }
  
  PVector intersectsPlane(Ray r){
    float a     = (rot.x*(pos.x-r.pos.x)+rot.y*(pos.y-r.pos.y)+rot.z*(pos.z-r.pos.z))/(rot.x*r.dir.x+rot.y*r.dir.y+rot.z*r.dir.z);
    float dist = sqrt(pow(r.pos.x + a * r.dir.x - pos.x, 2) + pow(r.pos.y + a * r.dir.y - pos.y, 2) + pow(r.pos.z + a * r.dir.z - pos.z, 2));   
    PVector intersectPoint = null;
    if(dist <= rad && a > 0.01){      //theoretically a > 0, but rounding errors cause problems
      intersectPoint = new PVector(r.pos.x + a * r.dir.x,r.pos.y + a * r.dir.y,r.pos.z + a * r.dir.z);
    }
    return intersectPoint;
  }
}
