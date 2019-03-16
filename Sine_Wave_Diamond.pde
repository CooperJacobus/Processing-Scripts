float x,y;
float time = 0;


void setup() {
  size(500,500);
  background(255);
  
}

void draw() {
  background(255);
  time = time + 1;
  textSize(16);
  fill(0);
  text(time,20,20);
  
  for (float i = 0; i < 500; i+=0.01){
    y = 250-((250-abs(250-i))*sin((i-time)*PI/16));
    x = i;
    
    fill(0,98,196,100);
    noStroke();
    ellipse(x,y,3,3);
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
}