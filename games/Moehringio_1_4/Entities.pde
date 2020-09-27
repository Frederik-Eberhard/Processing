class Entities{
  Entity E[];
  
  Entities(int size){
    E = new Entity[entSize];
    
    E[0] = new Player(new PVector(width/6.4,height/3.6),size);
    for(int i = 1; i < E.length; i++){      
      E[i] = new Entity(new PVector(random(100*width/32),random(100*width/32)),size);
      E[i].create_directions();
    }
  }
  
  void update(){
    PVector Pdist = E[0].MPos;
    for(Entity E : E){
      if(dist(Pdist.x,Pdist.y,E.MPos.x,E.MPos.y) < updateDist){
        E.update(true);
      }
      else{
        E.update(false);
      }
    }
    for(int i = 1; i < E.length; i++){
      if(E[0].get_entity_dist(E[i].pos)){
        E[0].dead();
      }
    }
  }
  
  void show(){
    for(Entity E : E){
      E.show();
    }
  }
  
  PVector getPlayerPos(){
    return E[0].pos;
  }
  PVector getPlayerVel(){
    return E[0].vel;
  }
  
  void movement_input(char c,boolean b){
    //println("HALLO");
    E[0].movement_input(c,b);
  }
  
}