class Population {
  Rocket[] rockets;
  ArrayList<Rocket> matingpool;
  int popsize;
  
  Population() {
    popsize = 100;
    rockets = new Rocket[popsize];
    matingpool = new ArrayList<Rocket>();
    for (int i = 0; i < popsize; i++){
      rockets[i] = new Rocket(); 
    }
  }
  
  void evaluate(){
    float maxfit = 0;
    for (int i = 0; i < popsize; i++){
      rockets[i].calcFitness();
      if(rockets[i].fitness > maxfit){
        maxfit = rockets[i].fitness;
      }   
    }  
    for (int i = 0; i < popsize; i++){
      rockets[i].fitness /= maxfit;
    }
    println("Maxfit " + maxfit);

    matingpool = new ArrayList<Rocket>();
    for (int i = 0; i < popsize; i++){
      float n = rockets[i].fitness * 100;
      for (int j = 0; j < n; j++){
        matingpool.add(rockets[i]);
      }
    }    
  }
  
  void selection(){
    Rocket[] newRockets = new Rocket[popsize];
    for(int i = 0; i < rockets.length; i++){
      DNA parentA = matingpool.get(int(random(0,matingpool.size()))).dna;
      DNA parentB = matingpool.get(int(random(0,matingpool.size()))).dna;
      DNA child = parentA.crossover(parentB);
      child.mutation();
      newRockets[i] = new Rocket(child);
    }
    rockets = newRockets;
  }
  
  void run(){
    for (int i = 0; i < popsize; i++){
      rockets[i].update();
      rockets[i].show();
    }
  }
}