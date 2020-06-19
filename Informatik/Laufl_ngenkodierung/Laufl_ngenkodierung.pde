import java.util.Vector;

// ********** Attribute **********
String name="11000111";                                     
Vector output = new Vector();
boolean pressed = false;
boolean neu = true; 
// ********** Hauptteil **********
void setup()                                        // Das Folgende wird einmal ausgeführt.
{
  size(1024,768);                                   //Größe des Fensters (try: fullScreen();)
  textFont(createFont("Monospaced",30));            //Schriftart und Größe
}

void draw()                                         //Das Folgende wird immer wieder ausgeführt.
{                               
  background(100);                                  //etwas grauer Hintergrund
  fill(#ff77ff);                                    // ... oder schön bunt in den Hexadezimalfarben RGB
  text(name,50,50 );                                // Textausgabe mit x- und y- Koordinaten
  if(pressed){
    if(neu){
      kodierung(name);
      neu = !neu;
    }
    String a = vecToStng(output);
    text(a,50,100);
  }
}

// ********** Methoden **********

void keyPressed()
{
  if(keyCode == 48){
    name += 0;
    neu = true;
  }
  if(keyCode == 49){
    name += 1;
    neu = true;
  }
}

void mouseClicked()
{
  if (mouseButton==LEFT)
  { 
    pressed = !pressed;
  }
}

void kodierung(String a){
  output.clear();
  char c = a.charAt(0);
  output.add(c);
  int num = 1;
  for(int i = 1; i < a.length(); i++){
    char temp = c;
    c = a.charAt(i);
    if( c == temp){
      num++;
    }else{
      println(num);
      output.add(num);
      num = 1;
    }
    if(i == a.length()-1){
      println(num);
      output.add(num);
    }
  }
  println(output);
}

String vecToStng(Vector a){
  String b = "";
  for(int i = 0; i < a.size(); i++){
    b+=a.elementAt(i);
    b+=" ";
  }
  return b;
}
