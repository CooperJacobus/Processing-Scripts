float a = 35;
float theta = a/180*PI;
float df = 0.35;
float dr = 0.15;
float g = 9.81;
float ballx;
float bally;
float v = 0;
float t = 0;
float tr = sqrt((2*dr)/(g*sin(theta)));
float vf = g*sin(theta)*tr;
float vfc = g*sin(theta)*cos(theta)*tr;
float tf = df/vf;
float tfc = df/vfc;

void setup(){
  size(300,200);
  background(255);
  
}

void draw(){
  theta = a/180*PI;
  
  tr = sqrt((2*dr)/(g*sin(theta)));
  vf = g*sin(theta)*tr;
  tf = df/vf;
  vfc = g*sin(theta)*cos(theta)*tr;
  tfc = df/vfc;
  
  background(255);
  
  textSize(16);
  stroke(0);
  fill(0);
  strokeWeight(1);
  
  text("Angle (Degrees):",20,20);
  text(a,185,20);
  text("Starting Height (m):",20,45);
  text(dr,185,45);
  text("Gate Distance (m):",20,70);
  text(df,185,70);
  
  line(20,80,250,80);
  
  text("Acceleration (m/s/s):",20,100);
  text(9.81*sin(theta),185,100);
  text(9.81*sin(theta)*cos(theta),235,100);
  text("Ramp Time (s):",20,125);
  text(tr,185,125);
  text("Final Velocity (m/s):",20,150);
  text(vf,185,150);
  text(vfc,235,150);
  text("Gate Time (s):",20,175);
  text(tf,185,175);
  text(tfc,235,175);
  
  noStroke();
  fill(0,100,200,100);
  
  if(mouseY < 25){
    rect(10,5,250,20);
    
    if (key == CODED) {
      if (keyCode == UP) {
        a = a+0.5;
        keyCode = LEFT;
        delay(200);
      } 
      if (keyCode == DOWN) {
        a = a-0.5;
        keyCode = LEFT;
        delay(200);
      } 
    }
  }
  
  if(mouseY < 50 && mouseY > 25){
    rect(10,30,250,20);
    
    if (key == CODED) {
      if (keyCode == UP) {
        dr = dr+0.005;
        keyCode = LEFT;
        delay(200);
      } 
      if (keyCode == DOWN) {
        dr = dr-0.005;
        keyCode = LEFT;
        delay(200);
      } 
    }
  }
  
  if(mouseY < 75 && mouseY > 50){
    rect(10,55,250,20);
    
    if (key == CODED) {
      if (keyCode == UP) {
        df = df+0.005;
        keyCode = LEFT;
        delay(200);
      } 
      if (keyCode == DOWN) {
        df = df-0.005;
        keyCode = LEFT;
        delay(200);
      } 
    }
  }
  
}