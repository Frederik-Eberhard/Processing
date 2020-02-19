Particle current;
ArrayList<Particle> snowflake;
void setup() {
  size(600, 600);
  current = new Particle(width/2, 0);
  snowflake = new ArrayList<Particle>();
}

void draw() {
  translate(width/2, height/2);
  background(0);
  current.update();

  if (current.finished() || current.intersects(snowflake)) {
    snowflake.add(current);
    current = new Particle(width/2, 0);
  }

  for (int i = 0; i < 6; i++) {
    rotate(PI/3 );
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }

    pushMatrix();
    scale(1, -1);
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }
    popMatrix();
  }
}