class DNA{
  PVector[] genes;
  DNA(){
    genes = new PVector[lifespan];
    for(int i = 0; i < lifespan; i++){
      genes[i] = PVector.random2D();
      genes[i].setMag(0.1);
    }
  }
  DNA(PVector[] gen){
    genes = gen;
  }
  
  DNA crossover (DNA parent){
    PVector[] newgenes = new PVector[lifespan]; 
    int mid = floor(random(genes.length));
    for(int i = 0; i < genes.length; i++){
      if(i > mid){
        newgenes[i] = genes[i];
      }else{
        newgenes[i] = parent.genes[i];
      }
    }
    return new DNA(newgenes);
  }
  
  void mutation (){
    for(int i = 0; i < genes.length; i++){
      if(random(1) < 0.01){
        genes[i] = PVector.random2D();
        genes[i].setMag(0.1);
      }
    }
  }
}