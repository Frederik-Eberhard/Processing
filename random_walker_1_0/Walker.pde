class Walker{
  int x,y;
  int r,g,b;
  int re,gr,bl;
  int a,lenght,dir;
  int direction;
  float time;
  float ndir;
  Walker(){
    x = width/2;
    y = height/2;
    r = 1;
    g = 100;
    b = 200;
    re = 1;
    gr = 1;
    bl = 1;
    a = 0;
    lenght = 1;
    dir = 0;
    direction = 0;
    time = 0;
    ndir = 0;
  }
  
  
  void render(){
    stroke(r,g,b);
    point(x,y);
  }
  void step(){
    int choice = int(random(4));
    
    switch (choice){
      case 0: x++; break;
      case 1: x--; break;
      case 2: y++; break;
      case 3: y--; break;
    }
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }

  void step_2(){
    float r = random(1);
    
    if(r < 0.4){
      x++;
    }else if(r < 0.6){
      y++;
    }else if(r < 0.7){
      x--;
    }else{
      y--;
    }
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
  
  void step_3(){  //making it less likely to pick the last direction
    int[] bucket = new int[7];
    int[] otherdir = new int[3];
    
    bucket[0] = direction;
    int b = 0;
    for(int i = 0; i <= 3; i++){
      if(i!=direction){
        otherdir[b] = i;
        b++;
      }
    }
    int a = 1;
    for(int i = 1; i < bucket.length-1; i=i+2){
        bucket[i] = otherdir[i-a];
        bucket[i+1] = otherdir[i-a];
        a++;
    }
    int random = int(random(bucket.length));
    direction = bucket[random];
    switch (direction){
      case 0: x++; break;
      case 1: x--; break;
      case 2: y++; break;
      case 3: y--; break;
    }
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
  
  void perlin_noise(){
    ndir = noise(time);
    time = time + .1;  //'randomness' value
    
    if(ndir < 0.2){
      x++;
    }else if(ndir < 0.4){
      y++;
    }else if(ndir < 0.6){
      x--;
    }else{
      y--;
    }
    
    println("perlin Noise ist gleich" + ndir);
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
  
  void spiral(){ //not quite working
    
    if(a==lenght){
      if(dir<4){
        dir++;
      }else{
        dir=0;
        lenght++;
      }
      a = 0;
    }
    
    switch (dir){
      case 0: x++; break;
      case 1: y++; break;
      case 2: x--; break;
      case 3: y--; break;
    }
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
    a++;
  }
  
  void tint(){
    if(r == 255 || r == 0){
      re = re * -1;  
    }
    if(g == 255 || g == 0){
      gr = gr * -1;  
    }
    if(b == 255 || b == 0){
      bl = bl * -1;  
    }
    r = r + re;
    g = g + gr;
    b = b + bl;
    println("r ist gleich " + r);
    println("g ist gleich " + g);
    println("b ist gleich " + b);
  }
}