class alpha{
  
 float x = random(width);
 float y = random(-300, -50);
 float z = random(0, 35);
 float length = map(z, 0, 20, 10, 20);  // map length from 0-20 (z length) to 10-20
 float ySpeed = map(z, 0, 20, 5, 15); 
 PFont f; 
 char main= (char) (0x3040 + random(0x54));
 float disappear= random(0,999);
 float reappear = random(1000,1500);
 
 
 void fall() {
   
   y = y+ ySpeed;
   ySpeed = ySpeed + 0.05;
   
   if(y > height) {
      y = random( -300, -50) ;   
      ySpeed = map(z, 0, 20, 5, 15);
   }
   
   
   
 }
 
 
 void show () {
   f = createFont("Arial Unicode MS Regular", map(z, 0, 20, 5, 25 ),true);
   textFont(f);
    if( y<disappear )
    fill (255, 255 , 255, map(z,0,20,150,200));  //the mapping is used to adjust opacity of the white character based on distance from the screen
    else if(y>disappear) fill(255, 255 , 255, 0);
    else if(y>reappear ) fill(255, 255 , 255, 255);  
  
   char c= (char) (0x3040 + random(0x54));
   text(main,x,y);
   textAlign((int)x);
   
   float ypos=y;
   for(int i=1 ; i<5;i++){
     fill(51, 204 , 51, map(z,0,20,150,200));
  
    //c= (char) (48 + random(0,47)); //english
    c= (char) (0x3041 + random(0x54)); //japanese
    
    if(y>500 && y <550)
    fill(51, 204 , 51, 0);   //randomly make characters disappear
    else fill(51, 204 , 51, map(y,0,1920,250,0));
    
     text(c,x,ypos- map(z,0,20,5,30));
     ypos= ypos- map(z,0,20,5,30);
     textAlign((int)x);
   }
   
   //float thickness = map(z, 0, 20, 1, 5 );
   //strokeWeight(thickness); 
   //stroke(51, 204 , 51);
   //line( x,y,x,y+length);
   
 }
  
  
  
  
}
