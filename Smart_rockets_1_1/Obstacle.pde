class Obstacle {
  PVector pos, dim;

  Obstacle(int x, int y, int w, int h) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
  }

  void show() {
    fill(255);
    rectMode(CENTER);
    rect(pos.x, pos.y, dim.x*2, dim.y*2);
  }
}