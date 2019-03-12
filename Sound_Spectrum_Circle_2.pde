import processing.sound.*;

SoundFile sample;
FFT fft;
AudioDevice device;

int bg = 255;
float time = 0;
float r;
float g;
float b;
int scale=5;
int bands = 128;
float bands2;
float[] sum = new float[bands];
float smooth_factor = 0.2;

void setup() {
  size(500,500);
  background(bg);
  
  device = new AudioDevice(this, 4400, bands);
  sample = new SoundFile(this, "Rap_Thing.aiff"); 
  sample.loop();

  fft = new FFT(this, bands);
  fft.input(sample);
}      

void draw() {
  background(bg);
  time = time + 0.05;
  r = 80*sin(time);
  g = 80*sin(time+1);
  b = 80*sin(time+2);
  bands2 = bands;
  fft.analyze();
  
  float mx = width/2;
  float my = height/2;

  for (int i = 0; i < bands; i+=1) {
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
    
    stroke(0);
    if(i>0){
      stroke(250-2*i,2*i,3*i);
      strokeWeight(6);
      line(mx+(100+(1000*sum[i]*(i+2)/16))*cos(i*(PI/(bands2-1))+PI/2),my+(100+(1000*sum[i]*(i+2)/16))*sin(i*(PI/(bands2-1))+PI/2),mx+(100+(1000*sum[i-1]*(i+1)/16))*cos((i-1)*(PI/(bands2-1))+PI/2),my+(100+(1000*sum[i-1]*(i+1)/16))*sin((i-1)*(PI/(bands2-1))+PI/2));
      line(mx-(100+(1000*sum[i]*(i+2)/16))*cos(i*(PI/(bands2-1))+PI/2),my+(100+(1000*sum[i]*(i+2)/16))*sin(i*(PI/(bands2-1))+PI/2),mx-(100+(1000*sum[i-1]*(i+1)/16))*cos((i-1)*(PI/(bands2-1))+PI/2),my+(100+(1000*sum[i-1]*(i+1)/16))*sin((i-1)*(PI/(bands2-1))+PI/2));
    }
    
    strokeWeight(6);
    //stroke(255);
    stroke(250-2*i,2*i,3*i);
    line(mx+100*cos(i*(PI/(bands2-1))+PI/2), my+100*sin(i*(PI/(bands2-1))+PI/2),mx+(100+(1000*sum[i]*(i+2)/16))*cos(i*(PI/(bands2-1))+PI/2),my+(100+(1000*sum[i]*(i+2)/16))*sin(i*(PI/(bands2-1))+PI/2));
    line(mx-100*cos(i*(PI/(bands2-1))+PI/2), my+100*sin(i*(PI/(bands2-1))+PI/2),mx-(100+(1000*sum[i]*(i+2)/16))*cos(i*(PI/(bands2-1))+PI/2),my+(100+(1000*sum[i]*(i+2)/16))*sin(i*(PI/(bands2-1))+PI/2));
    
    //(sum[i]*(height-100)*scale)*(i+1)/8+180
  }
  
  stroke(255);
  noStroke();
  fill(bg);
  ellipse(width/2,height/2,200,200);
  textSize(8);
  fill(0);
  text("(C) 2018 Cooper Jacobus. All Rights Reserved.", 10, height - 10);
  
  for (float i = 0; i < bands; i+= 0.5) {
    fill(250-2*i,2*i,3*i);
    noStroke();
    ellipse(mx+93*cos(i*(PI/(bands2-1))+PI/2), my+93*sin(i*(PI/(bands2-1))+PI/2),3,3);
    ellipse(mx-93*cos(i*(PI/(bands2-1))+PI/2), my+93*sin(i*(PI/(bands2-1))+PI/2),3,3);
    
    ellipse(mx+100*cos(i*(PI/(bands2-1))+PI/2), my+100*sin(i*(PI/(bands2-1))+PI/2),4,4);
    ellipse(mx-100*cos(i*(PI/(bands2-1))+PI/2), my+100*sin(i*(PI/(bands2-1))+PI/2),4,4);
    
    //Use this for spinny thing
    //float amp1 = 50+20*sin(5*i+time);
    //float amp2 = 50+20*sin(5*i+time);
    //ellipse(200+amp1*cos(i*(PI/(bands2-1))+PI/2), 200+amp1*sin(i*(PI/(bands2-1))+PI/2),5,5);
    //ellipse(200-amp2*cos(i*(PI/(bands2-1))+PI/2), 200+amp2*sin(i*(PI/(bands2-1))+PI/2),5,5);
    
  }
  
 
}
