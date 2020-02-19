class Cell{
  PVector pos;
  ArrayList<Edge> eds;
  Cell(Site position, ArrayList<Edge> edges){
    pos = new PVector(position.pos.x,position.pos.y);
    eds = new ArrayList<Edge>();
    for(int i = 0; i < edges.size(); i++){
      eds.add(edges.get(i));
    }
  }
  
  void display(){
    fill(random(255),random(255),random(255));
    beginShape();
    for(int i = 0; i < eds.size(); i++){
      vertex(eds.get(i).points[0].x,eds.get(i).points[0].y);
    }
    endShape();
  }
}