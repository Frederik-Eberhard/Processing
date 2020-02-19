Attractor a;
Mover[] movers;
Repulsor[] repulsors;

void setup() {
  //size(680, 360);
  fullScreen();
  a = new Attractor();

  movers = new Mover[100];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  
  repulsors = new Repulsor[10];
  for (int i = 0; i < repulsors.length; i++) {
    repulsors[i] = new Repulsor();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < repulsors.length; i++) {
    PVector force = new PVector();
    for (int j = 0; j < repulsors.length; j++) {
      if (j != i) {
        force.add(repulsors[j].repulse(repulsors[i]));
      }
    }
    force.add(a.attract(repulsors[i]));
    repulsors[i].applyForce(force);
  }
  
  for(Mover m : movers){
    PVector force = new PVector();
    for(Repulsor p : repulsors){
      force.add(p.repulse(m));
    }
    force.add(a.attract(m));
    m.applyForce(force);
  }
  for(Mover m : movers){
    m.update();   
    m.display();    
  }
  for(Repulsor r : repulsors){
    r.update();   
    r.display();    
  }
  
  a.display();
}