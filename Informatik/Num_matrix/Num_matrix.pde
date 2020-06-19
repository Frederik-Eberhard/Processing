final int NUM = 1000;

void setup() {
  size(500, 400);
  background(0);
  anzeige();
}

void anzeige() {
  for (int i = 0; i < NUM; i++) {
    int j = floor(i/10)+1;
    String a = "";
    a+=i+1;
    text(a, 40*((i%10)+(((i+1)<10)?.4:0)+(((i+1)%10 == 0 && (i+1) < 100)?.3:0)+((i<100)?.3:0)), 20*j);
  }
}
