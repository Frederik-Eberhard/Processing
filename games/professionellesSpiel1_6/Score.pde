class Score{
   int h,w,size,dist,num;
   int score[];
   String str;
   void setup(int n){
     num = n;
     h = height;
     w = width;
     str = "";
     score =  new int[num];
   }
   
   void addScore(int j, int i){
     score[j] += i;
   }
   
   void display(){
     display(1);
   }
   
   void display(int n){
     str = str(score[0]);
     textAlign(CENTER,CENTER);
     size = w / 5;
     dist = int(textWidth(str)) / 2 + width / 10;
     textSize(size);
     stroke(0);
     fill(200);
     //ellipse(w/2,h/2,20,20);
     if(n == 1){
       text(score[0],w/2,h/2);
     }
     if(n == 2){
       text(score[1],w/2 + dist, h/2 - size/9);  //rechts
       text(score[0],w/2 - dist, h/2 - size/9);  //links
       //println("size " + size);
     }
     //println(score);
   }
   
}
