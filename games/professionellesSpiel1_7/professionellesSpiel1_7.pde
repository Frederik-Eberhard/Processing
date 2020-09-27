Ball[] balls;
Balken[] players;
Score s;
particle[] particles;
Menu menu;
int gehweite, dead, gamemode, number;
boolean go, explode;
final int ANZAHL = 500;  // amount of particles

void setup() {
  //size(800, 600);
  fullScreen();
  rectMode(CENTER);
  go = false;
  explode  = false;
  gehweite = 4;
  gamemode = 1;  //1 = normal
  number = 1; // 1 = 1player, 2 = 2player
  menu = new Menu();
}

void draw() {
  background(0);
  if (menu.hidden == true) {
    if (go == true) {  //updates Balken und Ball, if the game starts
      for (Balken p : players) {
        p.update();
      }
      for (Ball b : balls){
        b.update();
        if(go == false)
          break;
      }
    }

    //SCORE
    s.display(number);   //displays score first

    if (explode) {      //if exploding display particles and no Ball
      for (particle pa : particles) {
        pa.update();
        pa.display();
      }
    } else {
      for (Ball b : balls)
        b.display();
    }

    if (dead >= ANZAHL) {
      explode = false;
      dead = 0;
    }
    for (Balken p : players) {
      p.display();
    }
  } else {
    menu.mousecheck(mouseX, mouseY);
    menu.display();
  }
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

void start() {
  if (gamemode == 1)
    balls = new Ball[1];
  else
    balls = new Ball[5];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
    balls[i].setup();
  }
  players = new Balken[number];
  for (int i = 0; i < players.length; i++) {
    players[i] = new Balken();
    players[i].setup(i);
  }
  s = new Score();
  s.setup(number);
}

//resets all but score
void reset() {
  for (int i = 0; i < balls.length; i++) {
    balls[i].setup();
  }
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