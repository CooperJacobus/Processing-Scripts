float m = 5.9722*pow(10,24);
float r = 6.371*pow(10,6);

float msun;
float rsun;

float g = 6.67*pow(10,-11);

float v;

float mrange = pow(10,27);
float rrange = pow(10,1);

float maxr = 1.482;

PImage img;

void setup(){
  size(500,500);
  background(255);
  img = loadImage("EscapeVelocityEquation.jpg");
}

void draw() {
  //maxr = (2*6.67*pow(10,-11)*mrange)/(pow(300000,2));
  if(mousePressed == true){
    m = mouseX-50;
    m = m/400*mrange;
    r = 450-mouseY;
    r = r/400*rrange;
  }
  
  if(m > mrange){
    m = mrange;
  }
  if(m < 0){
    m = 0;
  }
  
  if(r > rrange){
    r = rrange;
  }
  if(r < 0){
    r = 0;
  }
  
  msun = m/(5.9722*pow(10,24));
  rsun = r/(6.371*pow(10,6));
  
  background(255);
  
  if(keyPressed == true){
    image(img,90,100,width/1.5,height/3);
  }
  
  noStroke();
  fill(100,100,100);
  triangle(50,450,450,450-400*(maxr/rrange),450,450);
  
  fill(255);
  stroke(0);
  strokeWeight(3);
  
  line(50,450,450,450);
  line(50,50,50,450);
  
  ellipse(50,450-(400*r/rrange),12,12);
  ellipse(50+(400*m/mrange),450,12,12);
  
  ellipse(50+(400*m/mrange),450-(400*r/rrange),r/rrange*50,r/rrange*50);
  
  v = sqrt(2*g*m/r)*pow(10,-3);
  
  stroke(0);
  fill(0);
  
  textSize(14);
  text("Mass",420,470);
  text("Radius",4,60);
  text("Mass (Msun) =", 50,20);
  text("Radius (km) =", 50,40);
  text(msun,150,20);
  text(r,150,40);
  text("Min Escape Velocity (km/s) =", 50,470);
  
  textSize(16);
  text("r < m * 1.482 * 10^-21",260,435);
  textSize(22);
  
  if(v >= 299792){
    fill(200,0,0);
  }
  text(v,40,493);
  
  if(v >= 299792){
    noFill();
    rect(90,150,340,120);
    fill(0);
    textSize(30);
    text("BLACK HOLE", 170, 200);
    textSize(16);
    text("Escape Velocity exceeds the Speed of light",95,230);
  }
}