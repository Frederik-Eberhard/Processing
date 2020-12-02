 //Attempt at a rendering engine
//24.10.2020
//Frederik Eberhard

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
  background(100);
  cam = new Camera(new PVector(0,0,0), new PVector(0,0,1), 3,3);
  objects = new Object[1];
  lights = new Light[2];
  for(int i = 0; i < objects.length; i++){
    objects[i] = new Object(new PVector(0,0,1),1);
  }
  for(int i = 0; i < lights.length; i++){
    lights[i] = new Light(new PVector(0,i*5,-1));
    println(lights[i].pos);
  }  
}
void draw(){
  cam.getImage();
  index += 0.005;
  //cam.updatePosDir(new PVector(index,0,0), new PVector(0,0,1));
  //lights[0].updatePos(new PVector(index,0,0));
  //noLoop();
}
