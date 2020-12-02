class Object{
  PVector pos;
  float rad;
  
  Object(PVector pos_, float rad_){
    pos = pos_;
    rad = rad_;
  }
  
  void updatePos(PVector pos_){
    pos = pos_;
  }
}
