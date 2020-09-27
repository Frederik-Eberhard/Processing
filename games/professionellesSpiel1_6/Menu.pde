
class Menu {
  Button[] buttons;
  boolean hidden;
  int w, h, wspace, hspace, bh;
  Menu() {
    w = width/3;
    bh = height/7 - height/20;
    hspace = height/40;
    wspace = width/20;
    buttons = new Button[] {new Button("START", height / 2 - bh / 2 * 2 - hspace, w - wspace, bh), 
      new Button("PLAYERS", height / 2, w - wspace, bh), 
      new Button("MODE", height / 2 + bh / 2 * 2 + hspace, w - wspace, bh)};
    h = buttons.length * bh + (buttons.length+1) * hspace;
    rectMode(CENTER);
  }

  void display() {
    if (!hidden) {
      fill(255);
      rect(width/2, height/2, w, h);
      for (Button b : buttons) { 
        b.display();
      }
    }
  }

  void mousecheck(int x, int y) {
    if (!hidden) {
      for (int i = 0; i < buttons.length; i++) {
        if (x < buttons[i].pos.x + buttons[i].w/2 && x > buttons[i].pos.x - buttons[i].w/2 && y < buttons[i].pos.y + buttons[i].h/2 && y > buttons[i].pos.y - buttons[i].h/2) {  //check for inside of box
          buttons[i].colorChange("HOVER");
        } else {
          buttons[i].colorChange("");
        }
      }
    }
  }

  void mouseclicked() {
    if (!hidden) {
      int x = mouseX;
      int y = mouseY;
      for (int i = 0; i < buttons.length; i++) {
        if (x < buttons[i].pos.x + buttons[i].w/2 && x > buttons[i].pos.x - buttons[i].w/2 && y < buttons[i].pos.y + buttons[i].h/2 && y > buttons[i].pos.y - buttons[i].h/2) {  //check for inside of box
          buttons[i].task();
        }
      }
    }
  }
}