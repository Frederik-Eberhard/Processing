class Flock{
  final int BOID_SIZE = 1;
  final int NUMBER = 100;
  final int RAIDIUS = 10;
  final float ALIGNMENT_WEIGHT = .05;
  final float COHESION_WEIGHT = 1;
  final float SEPERATION_WEIGHT = .8;
  
  Boid boid[];

  Flock(){
    boid = new Boid[NUMBER];
    for(int i = 0; i < NUMBER; i++){
      boid[i] = new Boid(new PVector(random(0,width),random(0,height)), new PVector(1,0).rotate(random(0,PI*2)), RAIDIUS, BOID_SIZE);    
    }   
  }
  
  void show(){
    getVel();
    for(Boid boid:boid){
      boid.move();
      boid.show();
    }
  }
  
  void getVel(){
    for(Boid B:boid){
      PVector v1 = Alignment(B);
      PVector v2 = Cohesion(B);
      PVector v3 = Seperation(B);
    
      v1.mult(ALIGNMENT_WEIGHT);
      v2.mult(COHESION_WEIGHT);
      v3.mult(SEPERATION_WEIGHT);
      
      B.vel.add(v1).add(v2).add(v3);
      B.vel.normalize();
    }
  }
  
  PVector Alignment(Boid B){
    PVector v = new PVector(0,0);
    int count = 0;
    for(Boid b:boid){
      if(b != B && dist(B.pos.x,B.pos.y,b.pos.x,b.pos.y) < RAIDIUS){
        v.x += b.vel.x;
        v.y += b.vel.y;
        count++;
      }
    }
    if(count == 0) return v;
    v.x /= count;
    v.y /= count;
    v.normalize();
    return v;
  }
  
  PVector Cohesion(Boid B){
    PVector v = new PVector(0,0);
    int count = 0;
    for(Boid b:boid){
      if(b != B && dist(B.pos.x,B.pos.y,b.pos.x,b.pos.y) < RAIDIUS){
        v.x += b.pos.x;
        v.y += b.pos.y;
        count++;
      }
    }
    if(count == 0) return v;
    v.x /= count;
    v.y /= count;
    v = new PVector(v.x - B.pos.x, v.y - B.pos.y);
    v.normalize();
    return v;
  }
  
  
  PVector Seperation(Boid B){
    PVector v = new PVector(0,0);
    int count = 0;
    for(Boid b:boid){
      if(b != B && dist(B.pos.x,B.pos.y,b.pos.x,b.pos.y) < RAIDIUS){
        v.x += b.pos.x - B.pos.x;
        v.y += b.pos.y - B.pos.y;
        count++;
      }
    }
    if(count == 0) return v;
    v.x /= count;
    v.y /= count;
    v.mult(-1);
    v.normalize();
    return v;
  }

}