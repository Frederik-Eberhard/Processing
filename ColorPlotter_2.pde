final int pixelwidth = 5;
final int windowsize = 2;
final color base = color(20,20,150);
PImage img_col,img_val;
color plotRG[][];
color plotBG[][];
color plotRB[][];

void setup(){
  size(1544,516);
  img_col = loadImage("Images/LineImg_a_02.png");
  img_val = loadImage("Images/LineImg_c_02.png");  
  plotRG = new int[256][256];
  plotBG = new int[256][256];
  plotRB = new int[256][256];
  createPlots();
}

void draw(){
  background(200);
  lines();  
  display();
  stroke(255);
//  image(img_col,0,0,258,258);
  
}

void createPlots(){
   for(int i = 0; i < 256; i++){
     for(int j = 0; j < 256; j++){
        plotRG[i][j] = base;  
        plotBG[i][j] = base;  
        plotRB[i][j] = base;  
     }
   }
   println(img_col.pixels.length);
   for(int i = 0; i < img_col.pixels.length; i++){
     plotRG[int(red(img_col.pixels[i]))][255 - int(green(img_col.pixels[i]))] = color(img_val.pixels[i]);
     plotBG[int(blue(img_col.pixels[i]))][255 - int(green(img_col.pixels[i]))] = color(img_val.pixels[i]);
     plotRB[int(red(img_col.pixels[i]))][255 - int(blue(img_col.pixels[i]))] = color(img_val.pixels[i]);
   }
}

void lines(){
  stroke(0);
  strokeWeight(1*windowsize);
  line(0,0,0,257*windowsize);                            //1-256   R
  line(257*windowsize,0,257*windowsize,257*windowsize);  //258-513 G
  line(514*windowsize,0,514*windowsize,257*windowsize);  //515-770 B
  line(771*windowsize,0,771*windowsize,257*windowsize);
  line(0,0,772*windowsize,0);
  line(0,257*windowsize,772*windowsize,257*windowsize);
}

void display(){
  noStroke();
  for(int i = 0; i < 256; i++){
    for(int j = 0; j < 256; j++){
        fill(plotRG[i][j]);
        ellipse((i+1)*windowsize,(j+1)*windowsize,pixelwidth,pixelwidth);
    }
  }
  for(int i = 0; i < 256; i++){
    for(int j = 0; j < 256; j++){
        fill(plotBG[i][j]);
        ellipse((i+258)*windowsize,(j+1)*windowsize,pixelwidth,pixelwidth);
    }
  }
  for(int i = 0; i < 256; i++){
    for(int j = 0; j < 256; j++){
        fill(plotRB[i][j]);
        ellipse((i+515)*windowsize,(j+1)*windowsize,pixelwidth,pixelwidth);
    }
  }
}