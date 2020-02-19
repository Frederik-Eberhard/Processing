void setup(){
  background(0);
  size(400,400);
}

void draw(){
  float r1 = random(0,width);
  float r2 = random(0,width);
  
  if(r2 < r1){  //higher numbers are more likely to get picked
    stroke(10);
    ellipse(r1,height/2,10,10);
  }
}