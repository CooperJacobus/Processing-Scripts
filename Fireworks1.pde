float x,y;
float x2,y2;
float time = 0;
float b;
float X,Y;
float apex1,apex2;
float a;
float dot;
float boom = 0;
float fire = 0;
float r;


void setup() {
  size(500,500);
  background(255);
  
}

void draw() {
  background(255);
  if(mousePressed == true){
    time = 0;
    X = mouseX;
    Y = mouseY;
    background(255);
    boom = 0;
  }
  
  time = time + 0.01;
    x = time*100;
  
  if(x >= X){
    x = X;
    //if(boom == 0){
      time = 0;
    //}
    boom = 1;
  }
  
  b = X/100;
  
  apex1 = -0.005*X*X+b*X;
  a = (500-Y)/apex1;
  
  y = a*(-0.005*x*x+b*x);
  
  
  
  for(float i = x-40; i < x; i+=2){
    if(i <= X){
      y = a*(-0.005*i*i+b*i);
      fill(0,97,198,100);
      noStroke();
      dot = (i - x + 42)/4;
      ellipse(i,500-y,dot,dot);
    }
  }
  
  for(float i = 0; i < PI*2;  i+=PI/16){
    r = 50*log(time*2+1);
    for(float j = r - 20; j < r; j+=2){
      if(boom == 1){
        x = X+j*cos(i);
        y = Y+j*sin(i);
        fill(0,97,198,100);
        noStroke();
        dot = 8 - (r-j)/3;
        
        if(j < 100){
          ellipse(x,y,dot,dot);
        }
      }
      
      
    
    
    }
  }
  
}