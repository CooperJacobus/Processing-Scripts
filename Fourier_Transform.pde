int freqA, freqB, freqC = 1;
int[] freqs = new int[3];
float rFreq = 1;

float maxTime = TWO_PI*2;
float CMx = 0;
float CMy = 0;
int totalM = 0;

int maxFreq = 16;

float drawTime = 0;

void setup(){
  size(800,500);
  background(255);
  
  for(int i = 0; i < freqs.length; i++){
    freqs[i] = (int) (Math.random()*maxFreq + 1);
  }
  
  strokeWeight(2);
  stroke(100);
  fill(100);
  for(int co : freqs){
    line(250 + co*500/(maxFreq+2), 275, 250 + co*500/(maxFreq+2), 475);
    textSize(10);
    text(co, 250 + co*500/(maxFreq+2)-3, 265);
  }
}

void draw(){
  //background(255);
  noStroke();
  fill(255);
  rect(0,0,800,250);
  rect(0,0,250,500);
  CMx = 0;
  CMy = 0;
  totalM = 0;
  
  if(drawTime < freqs.length){
    for(float time = 0; time <= maxTime; time+= 0.005){
      //float y = ( (1 + sin(time*freqA)) + (1 + sin(time*freqB)) + (1 + sin(time*freqC)) )/3;
      
      float y = 0;
      for(int i = 0; i < freqs.length; i++){
        if(drawTime - i > 0 && drawTime - i < 1)
          y += (1 + (drawTime - i)*sin(time*freqs[i]));
        else if(drawTime - i <= 0)
          y += 1;
        else
          y += (1 + sin(time*freqs[i]));
      }
      y /= freqs.length;
      
      //Cartesian
      fill(0,100,200);
      noStroke();
      ellipse(25+(time*750/maxTime),225-(y*200/2),5,5);
    }
    drawTime += 0.01;
  }
  
  if(drawTime >= freqs.length){
  for(float time = 0; time <= maxTime; time+= 0.005){
      //float y = ( (1 + sin(time*freqA)) + (1 + sin(time*freqB)) + (1 + sin(time*freqC)) )/3;
      
      float y = 0;
      for(int co : freqs){
        y += (1 + sin(time*co));
      }
      y /= freqs.length;
      
      //Cartesian
      fill(0,100,200);
      noStroke();
      ellipse(25+(time*750/maxTime),225-(y*200/2),5,5);
      
      //Polar
      ellipse(125 + 100*y/2*cos(time*rFreq), 375 - 100*y/2*sin(time*rFreq),5,5);
      
      //Center addition
      CMx += y*cos(time*rFreq);
      CMy += y*sin(time*rFreq);
      totalM ++;
  }
  
  if(rFreq < maxFreq+2){
    rFreq += 0.01;
  }
}
  
  CMx /= totalM;
  CMy /= totalM;
  
  fill(200,100,0);
  ellipse(125 + CMx*100/2, 375 - CMy*100/2, 10, 10);
 
  ellipse(250 + rFreq*500/(maxFreq+2), 375 - CMy*400, 5,5);
  
  //fill(200,0,0);
  //ellipse(250 + rFreq*500/8, 375 - (pow(abs(CMy+1),4)-1)*100, 5,5);
  
  strokeWeight(3);
  stroke(0);
  
  
  line(25,225,25,25);
  line(25,225,775,225);
  fill(0,100,200);
  ellipse(25,125,10,10);
  
  noFill();
  ellipse(125,375,200,200);
  //ellipse(125,375,100,100);
}
