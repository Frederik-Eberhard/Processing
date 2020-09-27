class Balken {
  PVector pos;
  boolean goup, godown;
  int speed, h, w, num;
  void setup(int a) {
    num = a;
    speed = 10;
    h = height / 4;
    w = 5;//width / 30;
    goup = false;
    godown = false;
    if (num == 0) {
      pos = new PVector (w + 30, height / 2);
    }
    if (num == 1) {
      pos = new PVector (width - w - 30, height / 2);
    }
  }

  void update() {
    println(num + " up " + goup + " down " + godown);
    if (goup  && pos.y > h/2) {
      pos.y -= speed;
    }
    if (godown  && pos.y < height - h/2) {
      pos.y += speed;
    }
  }

  void press(char k) {
    if (num == 0) {
      if (k == 'w') {
        goup = true;
      }
      if (k == 's') {
        godown = true;
      }
    }

    if (num == 1) {
      if (k == 'u') {
        goup = true;
      }
      if (k == 'j') {
        godown = true;
      }
    }
  }

  void release(char k) {
    if (num == 0) {
      if (k == 'w') {
        goup = false;
      }
      if (k == 's') {
        godown = false;
      }
    }

    if (num == 1) {
      if (k == 'u') {
        goup = false;
      }
      if (k == 'j') {
        godown = false;
      }
    }
  }

  void display() {
    fill(255);
    rect(pos.x, pos.y, w, h);
  }
}
