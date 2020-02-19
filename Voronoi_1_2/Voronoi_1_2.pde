ArrayList<Site> Sites;
ArrayList<Edge> Edges;
ArrayList<Cell> Cells;
void setup() {
  size(600, 400);
  background(0);
  Sites = new ArrayList<Site>();
  Edges = new ArrayList<Edge>();
  Cells = new ArrayList<Cell>();

  //--points at infintity
  Sites.add(new Site(-width, -height));
  Sites.add(new Site(width*2, -height));
  Sites.add(new Site(width*2, height*2));
  Sites.add(new Site(-width, height*2));

  //--coresponding edges
  //--top left
  Edges.add(new Edge(new PVector(-10*width, -10*height), new PVector(width/2, -10*height)));
  Edges.add(new Edge(new PVector(width/2, -10*height), new PVector(width/2, height/2)));
  Edges.add(new Edge(new PVector(width/2, height/2), new PVector(-10*width/2, height/2)));
  Edges.add(new Edge(new PVector(-10*width/2, height/2), new PVector(-10*width, -10*height)));

  //--top right
  Edges.add(new Edge(new PVector(width/2, -10*height), new PVector(10*width, -10*height)));
  Edges.add(new Edge(new PVector(10*width, -10*height), new PVector(10*width, height/2)));
  Edges.add(new Edge(new PVector(10*width, height/2), new PVector(width/2, height/2)));
  Edges.add(new Edge(new PVector(width/2, height/2), new PVector(width/2, -10*height)));

  //--bottom right
  Edges.add(new Edge(new PVector(width/2, height/2), new PVector(10*width, height/2)));
  Edges.add(new Edge(new PVector(10*width, height/2), new PVector(10*width, 10*height)));
  Edges.add(new Edge(new PVector(10*width, 10*height), new PVector(width/2, 10*height)));
  Edges.add(new Edge(new PVector(width/2, 10*height), new PVector(width/2, height/2)));

  //--bottom left
  Edges.add(new Edge(new PVector(-10*width, height/2), new PVector(width/2, height/2)));
  Edges.add(new Edge(new PVector(width/2, height/2), new PVector(width/2, 10*height)));
  Edges.add(new Edge(new PVector(width/2, 10*height), new PVector(-10*width, 10*height)));
  Edges.add(new Edge(new PVector(-10*width, 10*height), new PVector(-10*width, height/2)));

  Cells.add(new Cell(Sites.get(0), copyedges(0, 3)));
  Cells.add(new Cell(Sites.get(1), copyedges(4, 7)));
  Cells.add(new Cell(Sites.get(2), copyedges(8, 11)));
  Cells.add(new Cell(Sites.get(3), copyedges(12, 15)));


  //Edges.add(new Edge(new PVector(0,0), new PVector(width,height)));
  /* for(int i = 0; i < Cells.size(); i++){
   Cells.get(i).display();
   println(i);
   }  */

  /*for(int i = 0; i < 10; i++){
   Sites.add(new Site(int(random(width)),int(random(height))));
   }*/
  Sites.add(new Site(int(width/2), int(height/2)));
  Sites.add(new Site(int(100), int(400)));
  Sites.add(new Site(int(250), int(100)));
  Sites.add(new Site(int(200), int(125)));
  //Sites.add(new Site(int(random(width)), int(random(height))));

  //main alogrithm
  for (int s = 4; s < Sites.size(); s++) {  //4 since the first four are already in use
    println("SITE:  " + s );
    Site cursite = Sites.get(s);          //current Site
    ArrayList<Edge> newCellEdges = new ArrayList<Edge>();
    for (int c = 0; c < Cells.size(); c++) {
      float x = (Cells.get(c).pos.x + cursite.pos.x)/2;  //x,y of middle between Cell and Site
      float y = (Cells.get(c).pos.y + cursite.pos.y)/2;
      println("x: " + x + "  y: " + y);
      PVector tangent = new PVector(cursite.pos.y - y, x - cursite.pos.x);  //tangente
      tangent.setMag(10000);
      Edge pb = new Edge(new PVector(x - tangent.x, y - tangent.y), new PVector(x + tangent.x, y + tangent.y));   //perpendicular bisector
      ArrayList<PVector> X = new ArrayList<PVector>();
      for (int e = 0; e < Cells.get(c).eds.size(); e++) {
        Edge curedge = Cells.get(c).eds.get(e);
        //println(curedge);
        //--{10]--
        PVector inter1 = lineIntersection(pb.points[0].x, pb.points[0].y, pb.points[1].x, pb.points[1].y, curedge.points[0].x, curedge.points[0].y, Cells.get(c).pos.x, Cells.get(c).pos.y);
        PVector inter2 = lineIntersection(pb.points[0].x, pb.points[0].y, pb.points[1].x, pb.points[1].y, curedge.points[1].x, curedge.points[1].y, Cells.get(c).pos.x, Cells.get(c).pos.y);
        if (inter1 != null && inter2 != null) {
          println("edge to close");
          for (int ie = 0; ie < Edges.size(); ie++) {    //remove curEdge from Edges
            if (Edges.get(ie).points.equals(Cells.get(c).eds.get(e).points)) {
              Edges.remove(ie);
            }
          }
          Cells.get(c).eds.remove(e);                  //remove cerEdge from Cell
          e = (e < Cells.get(c).eds.size())? e-1: e;  // for the loop so that no edge gets skipped
        }/*
        float emx = (curedge.points[0].x + curedge.points[1].x)/2; // edge middle x
         float emy = (curedge.points[0].y + curedge.points[1].y)/2; // edge middle y                       
         if (dist(cursite.pos.x, cursite.pos.y, emx, emy) < dist(cursite.pos.x, cursite.pos.y, x, y)) {  //if line is nearer to cursite than to cell site
         println("edge to close");
         for (int ie = 0; ie < Edges.size(); ie++) {    //remove curEdge from Edges
         if (Edges.get(ie).points.equals(Cells.get(c).eds.get(e).points)) {
         Edges.remove(ie);
         }
         }
         Cells.get(c).eds.remove(e);                  //remove cerEdge from Cell
         
         e = (e < Cells.get(c).eds.size())? e-1: e;  // for the loop so that no edge gets skipped
         }  */
        //--[11]--
        PVector intersect = new PVector();
        intersect = lineIntersection(pb.points[0].x, pb.points[0].y, pb.points[1].x, pb.points[1].y, curedge.points[0].x, curedge.points[0].y, curedge.points[1].x, curedge.points[1].y); 
        println(intersect);
        if (intersect != null) {
          // println("intersect: " + intersect);
          X.add(intersect);  //store intersection


          //for each point of the currrent edge check if they cross the pb if they connect back to their Site (if case that point needs to be changed

          PVector controllp1 = lineIntersection(pb.points[0].x, pb.points[0].y, pb.points[1].x, pb.points[1].y, curedge.points[0].x, curedge.points[0].y, Cells.get(c).pos.x, Cells.get(c).pos.y);
          if (controllp1 != null) {
            for (int ie = 0; ie < Edges.size(); ie++) {                   //find curedge in Edges
              if (Edges.get(ie).points.equals(Cells.get(c).eds.get(e).points)) {
                Edges.get(ie).points[0] = intersect;
              }
            }
            Cells.get(c).eds.get(e).points[0] = intersect;             //curedge = Cells.get(c).eds.get(e) -> just in case
          } else {
            for (int ie = 0; ie < Edges.size(); ie++) {                  //find curedge in Edges
              if (Edges.get(ie).points.equals(Cells.get(c).eds.get(e).points)) {
                Edges.get(ie).points[1] = intersect;
              }
            }
            Cells.get(c).eds.get(e).points[1] = intersect;             //curedge = Cells.get(c).eds.get(e) -> just in case
          }

          /*
          PVector p_a = curedge.points[0];
           PVector p_b = Cells.get(c).pos;  
           PVector p_c = curedge.points[1];
           PVector orthagonalToSite = new PVector();
           if(p_a.x == p_c.x){
           orthagonalToSite = new PVector(p_a.x,p_b.y);
           } else if(p_a.y == p_c.y){
           orthagonalToSite = new PVector(p_b.x,p_a.y);
           } else{
           orthagonalToSite = getorthagonalPoint(p_a,p_b,p_c);  //PVector showing the point on the curedge orthagonal to the Site of that cell -> this is for deleting further edge
           }
           //if one end of edge is closer to intersects than orthagonal to site then it has to be changed to be on intersects
           if(dist(curedge.points[0].x,curedge.points[0].y,intersect.x,intersect.y) < dist(curedge.points[0].x,curedge.points[0].y,orthagonalToSite.x,orthagonalToSite.y)) {
           for(int ie = 0; ie < Edges.size(); ie++){       //find curedge in Edges
           if(Edges.get(ie) == Cells.get(c).eds.get(e)){Edges.get(ie).points[0] = intersect;}
           }
           Cells.get(c).eds.get(e).points[0] = intersect;  //curedge = Cells.get(c).eds.get(e) -> just in case
           }
           else{
           for(int ie = 0; ie < Edges.size(); ie++){       //find curedge in Edges
           if(Edges.get(ie) == Cells.get(c).eds.get(e)){Edges.get(ie).points[1] = intersect;}
           }
           Cells.get(c).eds.get(e).points[1] = intersect;  //curedge = Cells.get(c).eds.get(e) -> just in case          
           }*/
        }
      }
      //--[12]--
      if (X.size() == 2) {
        //all stored at same location in memory!!! CHANGE
        //Edge newEdge = new Edge(new PVector(X.get(0).x, X.get(0).y), new PVector(X.get(1).x, X.get(1).y));
        Cells.get(c).eds.add(new Edge(new PVector(X.get(0).x, X.get(0).y), new PVector(X.get(1).x, X.get(1).y)));
        //println(Cells.get(c).eds.get(Cells.get(c).eds.size()-1));
        newCellEdges.add(new Edge(new PVector(X.get(0).x, X.get(0).y), new PVector(X.get(1).x, X.get(1).y)));
        //println(newCellEdges.get(newCellEdges.size()-1));
        Edges.add(new Edge(new PVector(X.get(0).x, X.get(0).y), new PVector(X.get(1).x, X.get(1).y)));
        //println(Edges.get(Edges.size()-1));
      }
    }
    //--[14]--
    Cells.add(new Cell(Sites.get(s), newCellEdges));
    for (int i = 0; i < Cells.size(); i++) {
      println("New Cell: " + i);
      Cells.get(i).roundEdges();
      Cells.get(i).sortEdges(0);
    }
  }

  for (int i = 0; i < Cells.size(); i++) {
    Cells.get(i).display();
    Sites.get(i).display();
    println(i);
  }
  for (int i = 0; i < Cells.get(4).eds.size(); i++) {
    println(Cells.get(4).eds.get(i).points);
  }
  for (int i = 0; i < Edges.size(); i++) {
    Edges.get(i).display();
    //println("  " + i + "  " + Edges.get(i).points[0] + "  " + Edges.get(i).points[0]);
  }
}


ArrayList<Edge> copyedges(int start, int end) {
  ArrayList<Edge> temp = new ArrayList<Edge>();
  for (int i = start; i < end+1; i++) {
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

PVector getorthagonalPoint(PVector p1, PVector p2, PVector p3) {
  float x = (-p2.x * ((p3.x-p1.x)/p3.y-p1.y) -p1.x * ((p3.y-p1.y)/p3.x-p1.x) + p2.y - p1.y)  /  (((p3.y-p1.y)/p3.x-p1.x) + ((p3.x-p1.x)/p3.y-p1.y));
  float y = ((p3.y-p1.y)/p3.x-p1.x) * x + p1.y - ((p3.y-p1.y)/p3.x-p1.x) * p1.x;
  return new PVector(x, y);
}