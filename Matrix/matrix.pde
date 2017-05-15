//(55, 55 , 55) // letter color
// ( 211, 211, 211) // BG

alpha[] d = new alpha[500];

void setup() {
  size(1920, 1080); 
  for (int i = 0; i < d.length; i++) {
    d[i] = new alpha();
  }
}

void draw(){
  background( 0, 20, 0);
  
   for (int i = 0; i < d.length; i++) {
    d[i].fall();
    d[i].show();
  }
}