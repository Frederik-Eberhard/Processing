ArrayList<Site> Sites;
ArrayList<Edge> Edges;
ArrayList<Cell> Cells;
void setup(){
  size(600,400);
  Sites = new ArrayList<Site>();
  Edges = new ArrayList<Edge>();
  Cells = new ArrayList<Cell>();
  
  //--points at infintity
  Sites.add(new Site(-width,-height));
  Sites.add(new Site(width*2,-height));
  Sites.add(new Site(width*2,height*2));
  Sites.add(new Site(-width,height*2));
 
  //--coresponding edges
    //--top left
  Edges.add(new Edge(new PVector(-10*width,-10*height), new PVector(width/2,-10*height)));
  Edges.add(new Edge(new PVector(width/2,-10*height), new PVector(width/2,height/2)));
  Edges.add(new Edge(new PVector(width/2,height/2), new PVector(-10*width/2,height/2)));
  Edges.add(new Edge(new PVector(-10*width/2,height/2), new PVector(-10*width,-10*height)));
  
    //--top right
  Edges.add(new Edge(new PVector(width/2,-10*height), new PVector(10*width,-10*height)));
  Edges.add(new Edge(new PVector(10*width,-10*height), new PVector(10*width,height/2)));
  Edges.add(new Edge(new PVector(10*width,height/2), new PVector(width/2,height/2)));
  Edges.add(new Edge(new PVector(width/2,height/2), new PVector(width/2,-10*height)));
  
    //--bottom right
  Edges.add(new Edge(new PVector(width/2,height/2), new PVector(10*width,height/2)));
  Edges.add(new Edge(new PVector(10*width,height/2), new PVector(10*width,10*height)));
  Edges.add(new Edge(new PVector(10*width,10*height), new PVector(width/2,10*height)));
  Edges.add(new Edge(new PVector(width/2,10*height), new PVector(width/2,height/2)));
  
    //--bottom left
  Edges.add(new Edge(new PVector(-10*width,height/2), new PVector(width/2,height/2)));
  Edges.add(new Edge(new PVector(width/2,height/2), new PVector(width/2,10*height)));
  Edges.add(new Edge(new PVector(width/2,10*height), new PVector(-10*width,10*height)));
  Edges.add(new Edge(new PVector(-10*width,10*height), new PVector(-10*width,height/2)));

  Cells.add(new Cell(Sites.get(0),copyedges(0,3)));
  Cells.add(new Cell(Sites.get(1),copyedges(4,7)));
  Cells.add(new Cell(Sites.get(2),copyedges(8,11)));
  Cells.add(new Cell(Sites.get(3),copyedges(12,15)));
  
  
  //Edges.add(new Edge(new PVector(0,0), new PVector(width,height)));
  for(int i = 0; i < Cells.size(); i++){
    Cells.get(i).display();
    println(i);
  }
  
   //main alogrithm
  for(int s = 4; s < Sites.size(); s++){  //4 since the first four are already in use
    Site cursite = Sites.get(s);  //current Site
    for(int c = 0; c < Cells.size(); c++){
      float x = (Cells.get(c).pos.x + cursite.pos.x)/2;  //x,y of middle between Cell and Site
      float y = (Cells.get(c).pos.y + cursite.pos.y)/2;
      PVector tangent = new PVector(cursite.pos.y - y, x - cursite.pos.x);  //tangente
      tangent.setMag(100);
      Edge pb = new Edge(new PVector(x - tangent.x, y - tangent.y),new PVector(x + tangent.x, y + tangent.y));   //perpendicular bisector
      ArrayList<PVector> X = new ArrayList<PVector>();
      for(int e = 0; e < Cells.get(c).eds.size(); e++){
        Edge curedge = Cells.get(c).eds.get(e);
        //--{10]--
        float emx = (curedge.points[0].x + curedge.points[1].x)/2; // edge middle x
        float emy = (curedge.points[0].y + curedge.points[1].y)/2; // edge middle y
        if(dist(cursite.pos.x,cursite.pos.y,emx,emy) < dist(cursite.pos.x,cursite.pos.y,x,y)){  //if line is nearer to cursite than to cell site
          for(int ie = 0; ie < Edges.size(); ie++){    //remove curEdge from Edges
            if(Edges.get(ie) == Cells.get(c).eds.get(e)){Edges.remove(ie);}
          }
          Cells.get(c).eds.remove(e);                  //remove cerEdge from Cell
          
          e = (e < Cells.get(c).eds.size())? e-1: e;  // for the loop so that no edge gets skipped
        }
        //--[11]--
        PVector intersect = new PVector();
        intersect = lineIntersection(pb.points[0].x,pb.points[0].y,pb.points[1].x,pb.points[1].y,curedge.points[0].x,curedge.points[0].y,curedge.points[1].x,curedge.points[1].y); 
        if(intersect != null){
          X.add(intersect);
          PVector p_a = curedge.points[0];
          PVector p_b = Cells.get(c).pos;  
          PVector p_c = curedge.points[1];
          PVector orthagonalToSite = getorthagonalPoint(p_a,p_b,p_c);  //PVector showing the point on the curedge orthagonal to the Site of that cell -> this is for deleting further edge
          
        }       
      }
    }
  }
}


ArrayList<Edge> copyedges(int start, int end){
  ArrayList<Edge> temp = new ArrayList<Edge>();
  for(int i = start; i < end+1; i++){
    temp.add(Edges.get(i));
  }
  return temp;
} 

PVector lineIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {  //https://github.com/processing/processing/wiki/Line-Collision-Detection
  // calculate the distance to intersection point
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  // if uA and uB are between 0-1, lines are colliding
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    return new PVector(x1 + (uA * (x2-x1)), y1 + (uA * (y2-y1)));
  }
  return null;
}