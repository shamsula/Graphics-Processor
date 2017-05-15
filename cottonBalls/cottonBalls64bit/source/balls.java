import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class balls extends PApplet {

drops[] b = new drops[5];

public void setup () {
    
   for(int i = 0; i< b.length; i++){
   b[i] = new drops(random(width),random(height));
   }
   
}

public void draw() {
 background(0, 89, 255); 
 
 loadPixels();
 for(int x = 0; x<width; x++){
 for(int y = 0; y<height; y++){
     int index = x + y * width;
     float sum = 0;
     for(drops b: b){
       float d = dist(x,y, b.pos.x, b.pos.y);
       sum +=  110* b.r / d;   //adjust radius to control glow size
     }
     //pixels[index] = color (20,101, sum); //setting 1 green, blue
     //pixels[index] = color (0,0, sum);  //neon blue 
     
      pixels[index] = color (sum, 210, 255);  //cotton candy 
     //pixels[index] = color (200,200, constrain(220,25,sum));
     //pixels[index] = color (200,200, sum % 255);  //crazy colour thing 
   }
 }
 
 updatePixels();
 
 for(drops b: b){
 b.update();
 //b.show(); //uncomment to show outline of drop 
 }
  
}
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
  
  public void update() {    //this function for motion 
   pos.add(vel); 
   
   if( pos.x > width || pos.x< 0  ){   // this for bounceback off corcners 
     vel.x *= -1;
   }
   
   if( pos.y > height || pos.y< 0  ){
     vel.y *= -1;
   }
   
  }
  
  public void show() {
    noFill();
    stroke(255);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
  
  
}
  public void settings() {  size(1024, 768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "balls" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
