Ball b;
Balken[] players;
Score s;
particle[] particles;
Menu menu;
PVector player_pos;
int gehweite, dead, gamemode, number;
boolean go, explode;
final int ANZAHL = 500;  // amount of particles

void setup() {
  size(800, 600);
  //fullScreen();
  rectMode(CENTER);
  go = false;
  explode  = false;
  gehweite = 4;
  gamemode = 2;  // 1 = 1player, 2 = 2player
  player_pos = new PVector(50, 300);

  b = new Ball();
  b.setup();
  if (gamemode == 1) {
    number = 1;
  } else if (gamemode == 2) {
    number = 2;
  }
  players = new Balken[number];
  for (int i = 0; i < players.length; i++) {
    players[i] = new Balken();
    players[i].setup(i);
  }
  s = new Score();
  s.setup(number);

  menu = new Menu();
}

void draw() {
  background(0);
  if (menu.hidden == true) {
    if (go == true) {  //updates Balken und Ball, if the game starts
      for (Balken p : players) {
        p.update();
      }
      b.update();
    }

    //SCORE
    s.display(number);   //displays score first

    if (explode) {      //if exploding display particles and no Ball
      for (particle pa : particles) {
        pa.update();
        pa.display();
      }
    } else {
      b.display();
    }

    if (dead >= ANZAHL) {
      explode = false;
      dead = 0;
    }
    for (Balken p : players) {

      p.display();
    }
  }
  menu.mousecheck(mouseX, mouseY);
  menu.display();
}  

void keyPressed() {
  if (keyCode == 10) {
    println("keypressed");
    go = true;
  } else {
    for (Balken p : players) {
      p.press(key);
    }
  }
}

void keyReleased() {
  for (Balken p : players) {
    p.release(key);
  }
}

void mouseClicked() {
  menu.mouseclicked();
}


//resets all but score
void reset() {
  b.setup();
  for (int i = 0; i < players.length; i++) {
    players[i].setup(i);
  }
  go = false;
}


void explode(PVector pos) {  //pos = position of ball
  particles = new particle[ANZAHL];
  for (int i = 0; i < ANZAHL; i++) {
    particles[i] = new particle();
    particles[i].setup(pos);
  }
  explode = true;
}