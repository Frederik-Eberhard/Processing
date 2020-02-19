class Edge{
  PVector[] points;
  Edge(PVector start, PVector end){
    points = new PVector[2];
    points[0] = start;
    points[1] = end;
  }
  
  void display(){
    stroke(255,110,110);
    strokeWeight(20);
    //fill(255,110,110);
    print(points[0].x + " " + points[0].y + " " + points[1].x + " " + points[1].y);
    line(points[0].x,points[0].y,points[1].x,points[1].y);
  }
}