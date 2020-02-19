float time = 0;
FloatList wave;
void setup() {
  size(600, 400);
  wave = new FloatList();
}

void draw() {
  background(0);
  translate(200, 200);
  float x = 0;
  float y = 0;

  for (int i = 0; i < 4; i++) {
    float prevx = x;
    float prevy = y;
    int n = i * 2 + 1;
    float radius = 50 * (4 / ( n * PI));
    x += radius*cos(n * time);
    y += radius*sin(n * time);


    stroke(255, 100);
    noFill();
    ellipse(prevx, prevy, radius*2, radius*2);

    fill(255);
    stroke(255);
    line(prevx, prevy, x, y);
  }
  wave.reverse();
  wave.append(y);
  wave.reverse();


  translate(200, 0);
  line(x-200, y, 0, y);
  beginShape();
  noFill();
  for (int i= 0; i < wave.size(); i++) {
    vertex(i, wave.get(i));
  }
  endShape();

  time += 0.05;

  if (wave.size()>200) {
    wave.remove(200);
  }
  println(wave.size());
}