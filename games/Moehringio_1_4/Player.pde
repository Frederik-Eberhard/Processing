class Player extends Entity {

  Player(PVector pos_, int size_) {
    super(pos_, size_);
    Col = color(200, 200, 0);
  }

  void show() {
    super.show();
  }

  void movement() {
    //println("VEL" + vel);
    get_direction(mouseX, mouseY);
    dir.add(MPos);
    velUpdate();
    collisions();
    goal();
    //println("pos",pos,"dir",dir); ///
    dir.sub(MPos);
    pos.add(vel);
  }

  //--seperate-functions-----------------
  void movement_input(char k, boolean b) {
    //println("k" + k);
    if (b) {
      switch(k) {
      case 'w':  w = true; break;
      case 'a':  a = true; break;
      case 's':  s = true; break;
      case 'd':  d = true; break;
      default :  break;
      }
    }
    if (!b) {
      switch(k) {
      case 'w':  w = false; break;
      case 'a':  a = false; break;
      case 's':  s = false; break;
      case 'd':  d = false; break;
      default :  break;
      }
    }
  }
  
  void goal(){
    println(pos.x/Msize,pos.y/Msize);
    if(M.Map[int(pos.x)/Msize][int(pos.y)/Msize] instanceof Goal){
      dead = true;
      Menu_active("Next Level");
    }
  }
}  