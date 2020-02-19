import java.util.Random;

int loop;
Random generator;
void setup(){
  size(400,300);
  generator = new Random();
  background(255);
}

void draw(){
  float h = (float) generator.nextGaussian();
  h = h * 10;
  h = h + 100; 

  fill(0);
  ellipse(width/2,height/2,h,h);
  
  println(loop);
  loop++;
}