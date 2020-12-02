//Attempt at a rendering engine
//24.10.2020
//Frederik Eberhard
//Newest Edition:  Scene setup
//---Notes----
//Objects:
//Camera  (width, height, position, direction (norm-vect)) [render]
//Objects (position, radius)
//Light   (position, radius) --> inheritence of object
Camera cam;
Object objects[];
Light lights[];
float index = 0;
void setup(){
  size(300,300);
  //fullScreen();
  background(100);
  cam = new Camera(new PVector(0,0,0), new PVector(0,0,1), 3,3,5);  //5.333,3 for fullscreen
  objects = new Object[2];
  lights = new Light[2];
  for(int i = 0; i < objects.length; i++){
    objects[i] = new Object(new PVector(0,-2,0),10,new PVector(0,1,0));
  }
  objects[1] = new Object(new PVector(0,-2,0),10,new PVector(0,1,0));
  objects[0] = new Object(new PVector(0,0,5),1);

  for(int i = 0; i < lights.length; i++){
    lights[i] = new Light(new PVector(i,2*i,5));
    println(lights[i].pos);
  }  
}
void draw(){
  cam.getImage();
  index += 0.01;
  //cam.updatePosDir(new PVector(index,0,0), new PVector(0,0,1));
  lights[0].updatePos(new PVector(index,0,-1));
  lights[1].updatePos(new PVector(1,2-index,-1));
  
  //objects[0].updateRot(new PVector(sin(index),0,1));
  noLoop();
}
