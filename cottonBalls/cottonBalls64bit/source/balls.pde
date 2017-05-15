drops[] b = new drops[5];

void setup () {
   size(1024, 768); 
   for(int i = 0; i< b.length; i++){
   b[i] = new drops(random(width),random(height));
   }
   
}

void draw() {
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