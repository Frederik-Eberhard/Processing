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
  for(int i = 4; i < Sites.size(); i++){  //4 since the first four are already in use
    Site cursite = Sites.get(i);  //current Site
    for(int c = 0; c < Cells.size(); c++){
      
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