Population pop;
Obstacle[] obstacles;
int lifespan, count;
float maxforce;
PVector target;

void setup() {
  //size(400, 300);
  fullScreen();
  lifespan = 300;
  count = 0;
  maxforce = float(width)/2000;
  println(maxforce);
  target = new PVector(width/2, height/6);
  pop = new Population();
  obstacles = new Obstacle[1];
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new Obstacle(width/2,height/2,width/4,height/60);
  }
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
  
  //obstacle
  for(Obstacle o: obstacles){
    o.show();
  }  
  //target
  ellipse(target.x,target.y,width/25,width/25);
}