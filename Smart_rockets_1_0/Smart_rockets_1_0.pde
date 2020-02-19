Population pop;
int lifespan, count;
PVector target;

void setup() {
  size(400, 300);
  //fullScreen();
  lifespan = height;
  count = 0;
  target = new PVector(width/2, 50);
  pop = new Population();
}

void draw() {
  background(0);
  //print("count " + count);
  pop.run(); 
  count++;
  if(count == lifespan){
    pop.evaluate();
    pop.selection();
    //pop = new Population();
    count = 0;
  }
   
  ellipse(target.x,target.y,16,16);
}