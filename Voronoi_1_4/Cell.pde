class Cell {
  PVector pos;
  ArrayList<Edge> eds;
  Cell(Site position, ArrayList<Edge> edges) {
    pos = new PVector(position.pos.x, position.pos.y);
    eds = new ArrayList<Edge>();
    for (int i = 0; i < edges.size(); i++) {
      eds.add(edges.get(i));
    }
  }

  void display() {
   // sortEdges(0);
    PVector col = new PVector(random(255), random(255), random(255));
    fill(col.x, col.y, col.z);
    //print("COLOR: " + col);
    beginShape();
    for (int i = 0; i < eds.size(); i++) {
      vertex(eds.get(i).points[0].x, eds.get(i).points[0].y);
    }
    endShape();
  }
  
  void roundEdges(){
    for(int i = 0; i < eds.size(); i++){
      eds.get(i).points[0].x = floor(eds.get(i).points[0].x/10)*10;//float(nf(eds.get(i).points[0].x,4,-1));
      eds.get(i).points[0].y = floor(eds.get(i).points[0].y/10)*10;//frloat(nf(eds.get(i).points[0].y,4,-1));
      eds.get(i).points[1].x = floor(eds.get(i).points[1].x/10)*10;//float(nf(eds.get(i).points[1].x,4,-1));
      eds.get(i).points[1].y = floor(eds.get(i).points[1].y/10)*10;//float(nf(eds.get(i).points[1].y,4,-1));
    }
  }

  void sortEdges(int index) {  
    Edge curEdge = eds.get(index);
    //println(" curedge " + curEdge.points[0] + " " + curEdge.points[1]);
    for(int i = index + 1; i < eds.size(); i++){
      //println("index: " + index + " i " + i);
      if(similarPV(curEdge.points[1],eds.get(i).points[0]) || similarPV(curEdge.points[1],eds.get(i).points[1])){
        if(similarPV(curEdge.points[1],(eds.get(i).points[1]))){  //switch points of Edge
          //print("SWAP:  index " + index + " curedge " + curEdge.points[0] + " " + curEdge.points[1] + "  before: " + eds.get(i).points[0] + " " + eds.get(i).points[1]);
          PVector tempPoint = new PVector(eds.get(i).points[1].x,eds.get(i).points[1].y);
          eds.get(i).points[1] = eds.get(i).points[0];
          eds.get(i).points[0] = tempPoint;
          //println("  after: " + eds.get(i).points[0] + " " + eds.get(i).points[1]);
        }
        Edge tempEdge = eds.get(i);
        eds.set(i,eds.get(index+1));
        eds.set(index+1, tempEdge);
        //println("i " + i + "  points  " + eds.get(index+1).points[0] + "  " + eds.get(index+1).points[1]);
        sortEdges(index+1);
        break;
      }
    } 
  }
}

boolean similarPV(PVector a, PVector b){
  float margin = .05;
  if(a.x < b.x + margin && a.x > b.x - margin && a.y < b.y + margin && a.y > b.y - margin){
    return true;
  }
  return false;
}