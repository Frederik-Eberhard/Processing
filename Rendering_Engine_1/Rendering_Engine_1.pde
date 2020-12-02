//Attempt at a rendering engien
//24.10.2020
//Frederik Eberhard

//---Notes----
//Objects:
//Camera  (width, height, position, direction (norm-vect)) [render]
//Objects (position, radius)
//Light   (position, radius) --> inheritence of object
Camera cam;
Object objects[];
void setup(){
  size(300,300);
  background(100);
  cam = new Camera(new PVector(0,0,0), new PVector(0,0,1), 3,3);
  objects = new Object[1];
  for(int i = 0; i < objects.length; i++){
    objects[i] = new Object(new PVector(0,0,1),1);
  }
}
void draw(){
  cam.getImage();
}
