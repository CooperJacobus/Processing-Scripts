float x,y;
float time = 0;
float a,b;

void setup() {
  size(500,500);
  background(255);
  
 }
 
 void draw() {
   background(255);
   strokeWeight(4);
   stroke(62,123,227,150);
   line(50,50,50,450);
   line(50,450,450,450);
   line(450,50,450,450);
   line(50,50,450,50);
   
   time = time + 0.01;
   a = 4.5 - 4*abs(sin(time));
   b = 4.5 - 4*abs(cos(time/2));
   
   for (float i = 0; i < PI/2; i+=PI/32) {
     x = 200*cos(i/a);
     y = 200*sin(i/b);
     
     if(x < PI/2){
       x = PI/2;
     }
     
     line(50+x,450,50,450-y);
     line(450-x,50,450,50+y);
     line(50+x,50,50,50+y);
     line(450-x,450,450,450-y);
   }
   
   
   
   
   
   
 }