class Entity {
  PVector pos, MPos, vel, dir;
  color Col;
  int size;

  Entity(PVector pos_, int size_) {
    pos = new PVector();
    MPos = new PVector();
    vel = new PVector();
    dir = new PVector(0, 0);
    pos = pos_;
    Col = color(0);
    size = size_;
  }

  void update() {
    movement();
    //--pos-to-MPos---------------
    MPos = getMapPos().add(pos);
    //println("Entity MPos: " + MPos);
  }

  void show() {
    fill(Col);
    ellipse(MPos.x, MPos.y, size, size);
  }

  void get_direction(int x, int y) {
    //pushMatrix();
    //translate(pos.x,pos.y);
    //--turning
    dir = new PVector(x, y);
    dir = dir.sub(pos);
    dir.normalize();
    //popMatrix();
  }

  void movement() {
    velUpdate();
    pos.add(vel);
  }

  void movement_input(char k, boolean b) {
  }  //only for Player

  void velUpdate() {
  }
}