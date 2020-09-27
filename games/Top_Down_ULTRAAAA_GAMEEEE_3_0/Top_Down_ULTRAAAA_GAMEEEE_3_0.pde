import java.util.Vector;

Player p;
Menu m;
Vector walls;
Vector enemys;
Vector tiles;
int levelnumber;
final int MAXNUM = 2;
boolean menu;  //sets visibility of Menu
void setup() {
  size(1280, 720);
  //fullScreen();  //fullscreen is weardly slow
  walls = new Vector();
  tiles = new Vector();
  enemys = new Vector();
  m = new Menu();
  menu = false;
  levelnumber = 0;
  level(false);
}

void draw() {
  background(255);
  p.update();
  if(menu) m.update();
  for (int i = 0; i < walls.size(); i++) {
    ((Wall)walls.elementAt(i)).display();
  }
  for (int i = 0; i < tiles.size(); i++){
    ((Tile)tiles.elementAt(i)).display();
  }
  for (int i = 0; i < enemys.size(); i++){
    ((Enemy)enemys.elementAt(i)).update();
    ((Enemy)enemys.elementAt(i)).display();
  }
  p.display();
  if(menu)  m.display();
  if(m.retry){boolean tempv = m.victory; clearall(); level(tempv);}
  if(p.next){if(levelnumber < MAXNUM){clearall(); level(true);}
             else{menu = true; m.victory = true;}}
}

void keyPressed() {
  p.press(key);
}

void keyReleased() {
  p.release(key);
}

void mousePressed() {
  p.shoot();
  for(int i = 0; i < m.buttons.length; i++){
   m.buttons[i].click();
  }
}


void createWalls(int number) {
  final int sizex = 32;
  final int sizey = 18;

  int num = number;                  //welche Map  (0-n)
  int begin = (sizey + 1)* num + 1;  //neue Map
  
  
  //--Map--Datei--lesen--
  String[] datei = loadStrings("/Maps/Maps.txt");
  int[][] map = new int[sizey][sizex];  //18/32
  println("y " + datei.length + " x " + (datei[1].length()/2+1));
  
  for(int i = begin; i < sizey + begin; i++){
    String[] parts = splitTokens(datei[i]);
    for(int j = 0; j < parts.length; j++){
      map[i - begin][j] = int(parts[j]);    
    }
  }
  
  for(int i = 0; i < map.length; i++){
    for(int j = 0; j < map[0].length; j++){
      print(map[i][j]);
    }
    println();
  }
  
  
  //--Map-Creation--
  final int MAXWALL = 2, MAXENEMY = 3, MAXTILE = 4;  //in case of needing more walls/enemys/tiles
  
  for (int i = 0; i < map.length; i++) {  
    for (int j = 0; j < map[0].length; j++) {
      //--player-creation--
      if (map[i][j] == 1){p = new Player((width/map[0].length)*j + width/(map[0].length*2), (height/map.length)*i + height/(map.length * 2));}
      //--wall-creation--
      if (map[i][j] > 1 && map[i][j] <= MAXWALL) {
        boolean[] neighbours = new boolean[4];
        if(i > 0)                {if(map[i - 1][j] > 1 && map[i - 1][j] <= MAXWALL) neighbours[0] = true;}  //top
        else neighbours[0] = false;
        if(j < map[0].length -1 ){if(map[i][j + 1] > 1 && map[i][j + 1] <= MAXWALL) neighbours[1] = true;}  //right
        else neighbours[1] = false;
        if(i < map.length - 1)   {if(map[i + 1][j] > 1 && map[i + 1][j] <= MAXWALL) neighbours[2] = true;}  //bottom
        else neighbours[2] = false;
        if(j > 0)                {if(map[i][j - 1] > 1 && map[i][j - 1] <= MAXWALL) neighbours[3] = true;}  //left
        else neighbours[3] = false;
        
        walls.add(new Wall((width/map[0].length)*j, (height/map.length)*i, map.length, map[0].length, map[i][j], neighbours));
      }
      //--enemy-creation--
      if (map[i][j] > MAXWALL && map[i][j] <= MAXENEMY){
        enemys.add(new Enemy((width/map[0].length)*j + width/(map[0].length*2), (height/map.length)*i + height/(map.length * 2), 3, "SNIPER"));
      }
      //--Ground-Tiles--
      if (map[i][j] > MAXENEMY && map[i][j] <= MAXTILE) {
        tiles.add(new Tile((width/map[0].length)*j, (height/map.length)*i, map.length, map[0].length, "END"));
      }    
    }
  }
  println(map.length + " " + map[0].length);
}


void clearall(){
  for(int i = 0; i < enemys.size();i++){
    ((Enemy)enemys.elementAt(i)).w.bullets.clear();
  }
  p.w.bullets.clear();
  walls.clear();// = new Vector();
  tiles.clear(); //= new Vector();
  enemys.clear(); //= new Vector();
  m = new Menu();
  menu = false;
  println("ALL CLEAR");
}

void level(boolean next){
  if(next) ++levelnumber;
  if(levelnumber > MAXNUM) levelnumber = 0;
  createWalls(levelnumber);
}