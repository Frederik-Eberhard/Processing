//---Notes---
//get rays (pos, dir)
class Camera{
  PVector pos,dir,persPoint;
  float w,h;
  boolean orthographic = true;
  
  Ray rays[];
  
  Camera(PVector pos_, PVector dir_, float w_, float h_, float pers_){
    pos = pos_;
    dir = dir_;
    w   = w_;
    h   = h_;
    if(pers_ > 0){
      persPoint = new PVector(-pers_*dir.x,-pers_*dir.y,-pers_*dir.z);  //point where Rays are cast out of
      orthographic = false;
    }
    getRays();
  }
  
  void getRays(){
    rays = new Ray[width*height]; //w * h of camera
    for(int i = 0; i < rays.length; i++){
      PVector Rpos = new PVector(pos.x - w/2 + ((w/width)*i) % w , pos.y + h/2 - (h/height)*floor(i/width) , pos.z);
      if(orthographic)
        rays[i] = new Ray(Rpos, dir);  //not factoring in rotation !!
      else
        rays[i] = new Ray(Rpos, new PVector(Rpos.x - persPoint.x,Rpos.y - persPoint.y,Rpos.z - persPoint.z).normalize());
   //   println(rays[i].pos.x + "  " + rays[i].pos.y);
    }  
  }
  
  void updatePosDir(PVector pos_, PVector dir_){
    pos = pos_;
    dir = dir_;
    getRays();
  }
  
  void getImage(){
    loadPixels();
    for(int i = 0; i < pixels.length; i++){
      pixels[i] = getColor(i);
    }
    updatePixels();
  }
  
  color getColor(int index){
    color c = color(0,100,0);
    PVector p = rays[index].intersects(objects[0]);
    if(p != null){
      float brightness = 0;
      for(int i = 0; i < lights.length; i++){
        brightness += getBrightness(p,lights[i]);
      }
      c = color(brightness,0,0);
    }
    return c;
  }
  
  float getBrightness(PVector v, Light l){
    
    PVector d = PVector.sub(l.pos, v);          
    d.normalize();                          //direction to Light
    Ray r = new Ray(v,d);
    PVector p = r.intersects(objects[0]);   //Intersection point of Ray in object

    float b = 0;
    if(p == null){    //if there is no intersection between v and light
      b = 255 / pow(v.dist(l.pos),2);
    }
    return b;
  }

}
