Attractor[] attractors;
Mover[] movers;

void setup() {
  //size(680, 360);
  fullScreen();
  attractors = new Attractor[4];
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor();
  }
  movers = new Mover[200];
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < attractors.length; i++) {
    PVector force = new PVector();
    for (int j = 0; j < attractors.length; j++) {
      if (j != i) {
        force.add(attractors[j].attract(attractors[i]));
      }
    }
    attractors[i].applyForce(force);
  }

  for (Attractor a : attractors) {
    a.update();   

    a.drag();
    a.hover(mouseX, mouseY);

    a.display();
  }

  for(Mover m : movers){
    PVector force = new PVector();
    for(Attractor a : attractors){
      force.add(a.attract(m));
    }
    m.applyForce(force);
  }
  for(Mover m : movers){
    m.update();   
    m.display();    
  }
}

void mousePressed() {
  for (Attractor a : attractors) {
    a.clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (Attractor a : attractors) {
    a.stopDragging();
  }
}