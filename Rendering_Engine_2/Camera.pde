//---Notes---
//get rays (pos, dir)
class Camera{
  PVector pos,dir;
  float w,h;
  
  Ray rays[];
  
  Camera(PVector pos_, PVector dir_, int w_, int h_){
    pos = pos_;
    dir = dir_;
    w   = w_;
    h   = h_;
    
    getRays();
  }
  
  void getRays(){
    rays = new Ray[width*height]; //w * h of camera
    for(int i = 0; i < rays.length; i++){
      rays[i] = new Ray(new PVector(pos.x - w/2 + ((w/width)*i) % w , pos.y + h/2 - (h/height)*floor(i/width) , pos.z), dir);  //not factoring in rotation !!
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
    color c = color(0,255,0);
    PVector p = rays[index].intersects(objects[0],pos);
    if(p != null){
      float d = distToLight(p);
      if(d != -1)
        c = color(255-d*d*30,0,0);
      else 
        c = color(0);
    }
    return c;
  }
  
  float distToLight(PVector v){
    PVector d = PVector.sub(lights[0].pos, v);
    d.normalize();
    Ray r = new Ray(v,d);
    PVector p = r.intersects(objects[0],lights[0].pos);
  //  println(v + " " + p);
    if(p == null)
 //   if(v.dist(lights[0].pos) < p.dist(lights[0].pos))    //if distance current point - light is smaller than intersectPoint - light --> current point is exposed to light
      return v.dist(lights[0].pos);
    return -1;
  }

}
