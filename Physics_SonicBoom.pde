float time1 = 0;
float time2;
float x1,x2,y;
float pow = 1.5;


void setup() {
  size(800,400);
  background(255);
  
}

void draw() {
  background(255);
  time1 = time1 + 0.1;;
  time2 = pow(time1,pow);
  x1 = time2;
  
  fill(0);
  ellipse(time2,200,10,10);
  
  for(float i = 0; i < 100; i++){
    float r = 0;
    x2 = pow(i,pow);
    y = 200;
    
    if(x1 > x2){
      r = 12*(time1 - i);
      noFill();
      ellipse(x2,y,r,r);
    }
    
   
  }
  
  
  
}