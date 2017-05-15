class drops {
  
  PVector pos;
  float r;
  PVector vel;
  
  drops(float x, float y) {
   pos = new PVector(x,y);
   r = 75;
   vel = PVector.random2D();
   vel.mult(random(3,7));
  }
  
  void update() {    //this function for motion 
   pos.add(vel); 
   
   if( pos.x > width || pos.x< 0  ){   // this for bounceback off corcners 
     vel.x *= -1;
   }
   
   if( pos.y > height || pos.y< 0  ){
     vel.y *= -1;
   }
   
  }
  
  void show() {
    noFill();
    stroke(255);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
  
  
}