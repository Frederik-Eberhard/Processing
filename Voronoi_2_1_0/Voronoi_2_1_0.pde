ArrayList<PVector> pvecs;
void setup(){    //works, but is realy slow since it goes 
  fullScreen();  //through all pixels and caculates the distance
                 //of every point to the pixel to color it
  pvecs = new ArrayList<PVector>();
  int rand = width*height/100;  //int(random(100));  //num of Points
  println(rand);
  for(int i = 0; i < rand; i++){
    pvecs.add(new PVector(random(width),random(height)));
  }
  
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      float mindist = 20;  //large number not possible to reach
      for(int i = 0; i < pvecs.size(); i++){
        mindist = (dist(x,y,pvecs.get(i).x,pvecs.get(i).y) < mindist) ? (dist(x,y,pvecs.get(i).x,pvecs.get(i).y)):mindist;
      }
      stroke(mindist*mindist);
      //println(mindist + " : " + mindist*mindist);
      point(x,y);
    }
  }
}

void draw(){
  
}