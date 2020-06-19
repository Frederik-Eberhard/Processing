String[][] daten = {
  {"Tim", "Hartmann", "Seelze", "18"}, 
  {"Frederik", "Eberhard", "Dedensen", "17"}, 
  {"Kilian", "Pluta", "Gümmer", "18"}, 
  {"Sophie", "Renz", "Letter", "18"}, 
  {"Lena", "Stöxen", "Letter", "18"}
};

void setup()    
  // Alles wird einmal ausgefuehrt.
{
  size(680, 480);                     // Fenstergroesse in Breite und Hoehe
  background(0);                      // Hintergrundfarbe von Schwarz (0) bis Weiss (255) 
  fill(#ff77ff);                      // Textfarbe als RGB 
  textSize(24);                       // Textgroesse, kann spaeter geaendert werden
  surface.setResizable(true);         //  Darf die Fenstergroesse veraendert werden oder nicht?
}


void draw()                           // Die Endlosschleife, dass wird immer wieder wiederholt.
{
  background(0);
  for (int i = 0; i < 5; i++)
  {
    for (int j = 0; j < 4; j++)
    {
      text(daten[i][j], 150+j*150, 70+ i*70);  // text(String, x-Koordinate, y-Koordinate);
    }
  }
}

void keyPressed()                     // Wenn irgendeine Taste gedrueckt wird, passiert das Folgende
{
  if (key == 'a') {
    sortDaten(0);
    println("Sorted FirstName");
  }
  if (key == 's') {
    sortDaten(1);
    println("Sorted LastName");
  }
  if (key == 'd') {
    sortDaten(2);
    println("Sorted City");
  }
  if (key == 'f') {
    sortDaten(3);
    println("Sorted Age");
  }
}

void sortDaten(int a) {
  boolean change = false;
  for (int i = 0; i < daten.length-1; i++) {
    for (int j = 0; j < daten[i][a].length(); j++) {
      if (j < daten[i+1][a].length()) {
        if (daten[i][a].charAt(j) > daten[i+1][a].charAt(j)) {
          for (int b = 0; b < daten[i].length; b++) {
            String temp = daten[i+1][b];
            daten[i+1][b] = daten[i][b];
            daten[i][b] = temp;
          }
          change = true;
          break;
        }
        if (daten[i][a].charAt(j) == daten[i+1][a].charAt(j)) {
          continue;
        }
        break;
      }
    }
  }
  if (change) {
    sortDaten(a);
  }
}
