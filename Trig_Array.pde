float x,y;
float xx,yy;
int s = 22;
float time = 0;
float w;

void setup() {
  size(500,500);
  background(255);
  
}

void draw() {
  background(255);
  
  time = time + 0.01;
  xx = 250*sin(time)+250;
  noStroke();
  fill(62,123,227,100);
  
  
  
  for(float i = s; i < 500; i+=s) {
    w = 32-abs(xx-i)/17;
    
   ellipse(i,s,w,w);
   ellipse(i,2*s,w,w);
   ellipse(i,3*s,w,w);
   ellipse(i,4*s,w,w);
   ellipse(i,5*s,w,w);
   ellipse(i,6*s,w,w);
   ellipse(i,7*s,w,w);
   ellipse(i,8*s,w,w);
   ellipse(i,9*s,w,w);
   ellipse(i,10*s,w,w);
   ellipse(i,11*s,w,w);
   ellipse(i,12*s,w,w);
   ellipse(i,13*s,w,w);
   ellipse(i,14*s,w,w);
   ellipse(i,15*s,w,w);
   ellipse(i,16*s,w,w);
   ellipse(i,17*s,w,w);
   ellipse(i,18*s,w,w);
   ellipse(i,19*s,w,w);
   ellipse(i,20*s,w,w);
   ellipse(i,21*s,w,w);
   ellipse(i,22*s,w,w);
   
   
   
   
  
   
  
  
  }
  
  
  
  
}