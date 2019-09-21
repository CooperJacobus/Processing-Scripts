Bird[] birds = new Bird[5];

float cx = 250;
float cy = 250;

float kx = random(50,450);
float ky = random(50,450);


void setup(){
  size(500,500);
  background(255);
  
  for(int i = 0; i < 5; i++){
    birds[i] = new Bird(random(50,450),random(50,450),0,0);
  }
}

void draw(){
  background(255);
  
  ellipse(cx,cy,20,20);
  fill(100,0,200);
  ellipse(kx,ky,10,10);
  
  cx += (mouseX-cx)/50;
  cy += (mouseY-cy)/50;
  
  if(Math.sqrt(Math.pow(cx-kx,2)+Math.pow(cy-ky,2)) < 150){
    kx += (kx-cx)/80;
    ky += (ky-cy)/80;
  }
  
  for(int i = 0; i < 5; i++){
    birds[i].display();
    birds[i].move();
  }
}

class Bird{
  float x,y,vx,vy;
  int r = 5;
  float speed = 1;
  
  Bird(float myX, float myY, float myVx, float myVy){
    x = myX;
    y = myY;
    vx = myVx;
    vy = myVy;
  }
  
  void display(){
    
    
    fill(0);
    ellipse(x,y,2*r,2*r);
  }
  
  void move(){
    vx += (cx >= x) ? 0.1 : -0.1;
    vy += (cy >= y) ? 0.1 : -0.1;
     
    x += vx;
    y += vy;
    
    if(x < 0){
      vx = 0;
      x = 0;
    }
    if(x > width){
      vx = 0;
      x = width;
    }
    if(y < 0){
      vy = 0;
      y = 0;
    }
    if(y > height){
      vy = 0;
      y = height;
    }
  }
}
