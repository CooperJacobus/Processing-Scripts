int n = 200;
int volume = 0;
int pressure = 0;
float pCounter = 0;
int maxPressure = 0;
int counter = 0;

Ball[] balls = new Ball[n];


void setup(){
  size(1000,500);
  background(255);
  
  for(int i = 0; i < n; i++){
    balls[i] = new Ball(random(50,550),random(50,550),random(-5,5),random(-5,5));
  }
}

void draw(){
  noStroke();
  fill(255);
  rect(0,0,500,height);
  
  stroke(0);
  strokeWeight(5);
  int h = Math.max(30,mouseY);
  h = Math.min(h,500);
  line(0,h,500,h);
  line(0,500,width,500);
  line(500,0,500,500);
  
  for (Ball myBall : balls){
    myBall.move();
    myBall.display();
  }
  for(int i = 0; i < n-1; i++){
    for(int j = i+1; j < n; j++){
      balls[i].collide(balls[j]);
    }
  }
  
  if(counter < 10) counter++;
  else{
    counter = 0;
    volume = h;
    pressure = (int)(pCounter/(2*width + 2*h)*1800);
    pCounter = 0;
    
    noStroke();
    fill(50,0,100,150);
    ellipse(500+volume,500-pressure,10,10);
  }
  
  textSize(16);
  text("Volume: " + volume, 75, 550);
  text("Pressure: " + pressure, 325, 550);
  
}

class Ball{
  float x,y,vx,vy;
  int r = 5;
  
  Ball(float myX, float myY, float myVx, float myVy){
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
    x += vx;
    y += vy;
    
    int h = Math.max(30,mouseY);
    h = Math.min(h,500);
  
    if(x >= 500 - r){
      x = 500 - r;
      vx *= -1;
      pCounter += Math.abs(vx);
    }
    if(x <= r){
      x = r;
      vx *= -1;
      pCounter += Math.abs(vx);
    }
    if(y >= h - r){
      y = h - r;
      vy *= -1;
      pCounter += Math.abs(vy);
    }
    if(y <= r){
      y = r;
      vy *= -1;
      pCounter += Math.abs(vy);
    }
  }
  
  void collide(Ball other){
    float dist = (float) Math.sqrt(Math.pow(x-other.x,2) + Math.pow(y-other.y,2));
    if(dist <= 2 * r){
      float xDist = x - other.x;
      float yDist = y - other.y;
      
      //rotate for 1D Momentum transfer
      float theta = (float) Math.atan(yDist/xDist);
      float vx1 = (float)(Math.cos(theta)*vx + Math.sin(theta)*vy);
      float vy1 = (float)(-1*Math.sin(theta)*vx + Math.cos(theta)*vy);
      float vx2 = (float)(Math.cos(theta)*other.vx + Math.sin(theta)*other.vy);
      float vy2 = (float)(-1*Math.sin(theta)*other.vx + Math.cos(theta)*other.vy);
      
      //Momentum Transfer 
      vx1 = vx1 + vx2;
      vx2 = vx1 - vx2;
      vx1 = vx1 - vx2;
      
      vx = (float)(Math.cos(theta)*vx1 - Math.sin(theta)*vy1);
      vy = (float)(Math.sin(theta)*vx1 + Math.cos(theta)*vy1);
      other.vx = (float)(Math.cos(theta)*vx2 - Math.sin(theta)*vy2);
      other.vy = (float)(Math.sin(theta)*vx2 + Math.cos(theta)*vy2);
      
      
      float xOverlap = xDist/(2*r)*(5-dist);
      float yOverlap = yDist/(2*r)*(5-dist);
      x -= xOverlap/2;
      y -= yOverlap/2;
      other.x += xOverlap/32;
      other.y += yOverlap/32;
    }
  }
}
