final int pixelwidth = 3;

PImage img_col,img_val;
int plotRG[][];
int plotBG[][];
int plotRB[][];

void setup(){
  size(772,258);
  img_col = loadImage("Images/Image_01.png");
  plotRG = new int[256][256];
  plotBG = new int[256][256];
  plotRB = new int[256][256];
  createPlots();
}

void draw(){
  background(204);
  lines();  
  display();
//  image(img_col,0,0,258,258);
  
}

void createPlots(){
   for(int i = 0; i < 256; i++){
     for(int j = 0; j < 256; j++){
        plotRG[i][j] = 0;  
     }
   }
   for(int i = 0; i < 256; i++){
     for(int j = 0; j < 256; j++){
        plotBG[i][j] = 0;  
     }
   }
   for(int i = 0; i < 256; i++){
     for(int j = 0; j < 256; j++){
        plotRB[i][j] = 0;  
     }
   }
   println(img_col.pixels.length);
   for(int i = 0; i < img_col.pixels.length; i++){
     plotRG[int(red(img_col.pixels[i]))][int(green(img_col.pixels[i]))] = 1;
     plotBG[int(blue(img_col.pixels[i]))][int(green(img_col.pixels[i]))] = 1;
     plotRB[int(red(img_col.pixels[i]))][int(blue(img_col.pixels[i]))] = 1;
   }

/*
   for(int i = 0; i < 10; i++){
       plotRG[int(random(0,256))][int(random(0,256))] = 1;
   }
   for(int i = 0; i < 10; i++){
       plotRG[int(random(0,256))][int(random(0,256))] = 2;
   }
   for(int i = 0; i < 10; i++){
       plotRG[int(random(0,256))][int(random(0,256))] = 3;
   }

   for(int i = 0; i < 10; i++){
       plotBG[int(random(0,256))][int(random(0,256))] = 1;
   }
   for(int i = 0; i < 10; i++){
       plotBG[int(random(0,256))][int(random(0,256))] = 2;
   }
   for(int i = 0; i < 10; i++){
       plotBG[int(random(0,256))][int(random(0,256))] = 3;
   }
   
   for(int i = 0; i < 10; i++){
       plotRB[int(random(0,256))][int(random(0,256))] = 1;
   }
   for(int i = 0; i < 10; i++){
       plotRB[int(random(0,256))][int(random(0,256))] = 2;
   }
   for(int i = 0; i < 10; i++){
       plotRB[int(random(0,256))][int(random(0,256))] = 3;
   }
*/
}

void lines(){
  stroke(0);
  strokeWeight(1);
  line(0,0,0,257);      //1-256   R
  line(257,0,257,257);  //258-513 G
  line(514,0,514,257);  //515-770 B
  line(771,0,771,257);
  line(0,0,772,0);
  line(0,257,772,257);
}

void display(){
  strokeWeight(0);
  for(int i = 0; i < 256; i++){
    for(int j = 0; j < 256; j++){
      if(plotRG[i][j] == 1){
        fill(0,0,0);
        ellipse(i+1,j+1,pixelwidth,pixelwidth);
      }else if(plotRG[i][j] == 2){
        fill(0,255,0);
        ellipse(i+1,j+1,pixelwidth,pixelwidth);
      }else if(plotRG[i][j] == 3){
        fill(255,255,255);
        ellipse(i+1,j+1,pixelwidth,pixelwidth);
      }
    }
  }
  for(int i = 0; i < 256; i++){
    for(int j = 0; j < 256; j++){
      if(plotBG[i][j] == 1){
        fill(0,0,0);
        ellipse(i+258,j+1,pixelwidth,pixelwidth);
      }else if(plotRG[i][j] == 2){
        fill(0,255,0);
        ellipse(i+258,j+1,pixelwidth,pixelwidth);
      }else if(plotRG[i][j] == 3){
        fill(255,255,255);
        ellipse(i+258,j+1,pixelwidth,pixelwidth);
      }
    }
  }
  for(int i = 0; i < 256; i++){
    for(int j = 0; j < 256; j++){
      if(plotRB[i][j] == 1){
        fill(0,0,0);
        ellipse(i+515,j+1,pixelwidth,pixelwidth);
      }else if(plotRG[i][j] == 2){
        fill(0,255,0);
        ellipse(i+515,j+1,pixelwidth,pixelwidth);
      }else if(plotRG[i][j] == 3){
        fill(255,255,255);
        ellipse(i+515,j+1,pixelwidth,pixelwidth);
      }
    }
  }
}