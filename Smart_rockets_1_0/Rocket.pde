class Rocket {
  DNA dna;
  PVector pos, vel, acc;
  float fitness, time;
  boolean completed;

  Rocket() {
    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dna = new DNA();
    fitness = 0;
    time = 0;
    completed = false;
  }
  Rocket(DNA newdna) {
    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dna = newdna;
    fitness = 0;
    time = 0;
    completed = false;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void calcFitness() {
    float d = dist(pos.x, pos.y, target.x, target.y);  
    fitness = map(d, 0, width, width, 0);  //inverts distance
    if (completed) {
      println("time " + time);
      time = map(time, 0, lifespan, lifespan, 0);
      time = map(time, 0, lifespan, 1, 5);
      println("time " + time);
      fitness *= 10;
      fitness = pow(fitness,time);
      println("fitness " + fitness);
    }
  }

  void update() {

    float d = dist(pos.x, pos.y, target.x, target.y);
    if (d < 10) {
      completed = true;
      pos = target.copy();
      if(time == 0){
        time=count;
      }
    }

    if (!completed) {
      applyForce(dna.genes[count]);
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    fill(255, 150);
    translate(pos.x, pos.y);
    rotate(vel.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5 );
    popMatrix();
  }
}