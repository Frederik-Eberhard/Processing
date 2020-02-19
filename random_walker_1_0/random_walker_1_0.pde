Walker w;
int tintamount = 5;
int t = tintamount;
void setup() {
   //fullScreen();
   size(400,400);
   w = new Walker();
   background(0);
}

void draw(){
  w.perlin_noise();
  if(t == 0){  //slower tint change
    w.tint();
    t = tintamount;
  }
  t--;
  w.render();
}