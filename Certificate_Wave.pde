float x, y;
float a,b,c,d,e;

void setup() {
  size(500,500);
  background(255);
  
}

void draw() {
  background(255);
  fill(130,50,150);
  noStroke();
  a = 20;
  b = 30;
  c = 5;
  d = 10;
  e = 100;
  
  for(float j = 0; j < 100; j+=10){
    for(float i = 0; i < 500; i+=0.5){
      x = i;
      y = a*sin((i+j)/(c*PI))+b*sin(i/(d*PI))+e;
      ellipse(x,y,1,1);
      ellipse(x,y+70,1,1);
    }
  }
  
}