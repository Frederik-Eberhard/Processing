Ball[] b;
int number = 100;

void setup(){
  //size(400,300);
  fullScreen();
  frameRate(100);
  b = new Ball[number];
  for(int i = 0; i < number ; i++){
    b[i] = new Ball();
  }
}

void draw(){
  background(0);
  for(int i = 0; i<number;i++){
    b[i].move();
    b[i].bounce();
    b[i].tint(i);
    b[i].display();
  }
}