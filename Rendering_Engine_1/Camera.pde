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
    
    rays = new Ray[width*height]; //w * h of camera
    for(int i = 0; i < rays.length; i++){
      rays[i] = new Ray(new PVector(pos.x - w/2 + ((w/width)*i) % w , pos.y + h/2 - (h/height)*floor(i/width) , pos.z), dir);  //not factoring in rotation !!
   //   println(rays[i].pos.x + "  " + rays[i].pos.y);
    }
  }
  
  void getImage(){
    loadPixels();
    for(int i = 0; i < rays.length; i++){
      pixels[i] = rays[i].getColor(objects[0]);
    }
    updatePixels();
  }
}
