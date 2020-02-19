
float angel = 0;

PVector[] points = new PVector[8];

float[][] projection = {
  {1, 0, 0},
  {0, 1, 0}
};

void setup() {
  size(600,400);
  
  points[0] = new PVector(-0.5, -0.5, -0.5);
  points[1] = new PVector(0.5, -0.5, -0.5);
  points[2] = new PVector(0.5, 0.5, -0.5);
  points[3] = new PVector(-0.5, 0.5, -0.5);
  points[4] = new PVector(-0.5, -0.5, 0.5);
  points[5] = new PVector(0.5, -0.5, 0.5);
  points[6] = new PVector(0.5, 0.5, 0.5);
  points[7] = new PVector(-0.5, 0.5, 0.5);
}

void draw() {
  background(0);
  translate(width/2,height/2);

  
  float[][] rotationX = {
    { 1, 0, 0},
    { 0, cos(angel), -sin(angel)},
    { 0, sin(angel),  cos(angel)},
  };
  
  float[][] rotationY = {
    { cos(angel), 0, -sin(angel)},
    { 0, 1, 0},
    { sin(angel), 0,  cos(angel)}
  };
  
  float[][] rotationZ = {
    { cos(angel), -sin(angel), 0},
    { sin(angel),  cos(angel), 0},
    { 0,  0, 1}
  };
  
  
  PVector[] projected = new PVector[8];
  
  int index = 0;
  for (PVector v : points) {
    PVector rotated = matrixToVec(matmult(rotationY,v));
    rotated = matrixToVec(matmult(rotationX,rotated));
    rotated = matrixToVec(matmult(rotationZ,rotated));
    PVector projected2d = matrixToVec(matmult(projection,rotated));
    projected2d.mult(200);
    projected[index] = projected2d;
    //point(projected2d.x,projected2d.y);
    index++;
  }
  
  for (PVector v : projected){
    stroke(255);
    strokeWeight(16);
    noFill();  
    point(v.x, v.y); 
  }
  
  //Connecting the edges
  for(int i = 0; i < 4; i++){
    connect(i, (i+1) % 4, projected);
    connect(i+4, ((i+1) % 4)+4, projected);
    connect(i, i+4, projected);
  }
  
  angel += 0.03;
}

void connect(int i, int j, PVector[] points){
 PVector a = points[i];
 PVector b = points[j];
 strokeWeight(1);
 stroke(255);
 line(a.x, a.y, b.x, b.y);
}