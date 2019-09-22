int n = 86;
Boid[] boids = new Boid[n];

void setup(){
  size(900,600);
  background(255);
  
  for(int i = 0; i < n; i++){
    boids[i] = new Boid(random(50, width-50),random(50, height-50),random(0,2*PI));  
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < n; i++){
    boids[i].display();
    boids[i].move();
    
    if(i < n-1){
      for(int j = i+1; j < n; j++){
        boids[i].align(boids[j]);
      }
    }
    
  }
  
}

class Boid{
  float x,y,theta;
  float speed = 2;
  
  Boid(float myX, float myY, float myTheta){
    x = myX;
    y = myY;
    theta = myTheta;
  }
  
  void display(){
    fill(0);
    ellipse(x,y,5,5);
    line(x, y, x+10*(float)Math.cos(theta), y+10*(float)Math.sin(theta));
    triangle(x+10*(float)Math.cos(theta), y+10*(float)Math.sin(theta), x+5*(float)Math.cos(theta+PI/2), y+5*(float)Math.sin(theta+PI/2), x+5*(float)Math.cos(theta-PI/2), y+5*(float)Math.sin(theta-PI/2));
    
    //text(theta, x, y-10);
  }
  
  void move(){
    x += Math.cos(theta)*speed;
    y += Math.sin(theta)*speed;
    
    if(x < 0) x = width;
    if(x > width) x = 0;
    if(y < 0) y = height;
    if(y > height) y = 0;
    
    if(x < 100){
      //if(theta > PI) theta += PI/64;
      //else theta -= PI/64;
    }
    
    if(x > width-100){
      //if(theta > PI) theta -= PI/64;
      //else theta += PI/64;
    }
    
    if(y < 100){
      //if(theta > 3*PI/2) theta += PI/64;
      //else theta -= PI/64;
    }
    
    if(y > height-100){
      //if(theta > PI/2) theta += PI/64;
      //else theta -= PI/64;
    }
    
    theta = (theta + 2*PI) %(2*PI);
  }
  
  void align(Boid other){
    float dist = (float)Math.sqrt(Math.pow(x-other.x,2)+Math.pow(y-other.y,2));
    if(dist < 50){
      if(other.theta > theta){
        other.theta -= PI/128;
        theta += PI/128;
      }
      else{
        other.theta += PI/128;
        theta -= PI/128;
      }
    }
    if(dist < 20){
      if(other.theta < theta){
        other.theta -= PI/32;
        theta += PI/32;
      }
      else{
        other.theta += PI/32;
        theta -= PI/32;
      }
    }
    
  }
}
