import processing.sound.*;

SoundFile sample;
FFT fft;
AudioDevice device;

float time = 0;
float r;
float g;
float b;
int scale=5;
int bands = 256;
float[] sum = new float[bands];
float smooth_factor = 0.2;

void setup() {
  size(1200, 360);
  background(255);
  
  device = new AudioDevice(this, 4400, bands);
  sample = new SoundFile(this, "Yorktown.aiff"); 
  sample.loop();

  fft = new FFT(this, bands);
  fft.input(sample);
}      

void draw() {
  background(255);
  fill(0,100,200);
  noStroke();
  time = time + PI/64;
  r = 80*sin(time);
  g = 80*sin(time+1);
  b = 80*sin(time+2);
  
  fft.analyze();

  for (int i = 0; i < bands; i+=1) {
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
    strokeWeight(4);
    stroke(200-i+r,i+g,1.5*i+b);
    line(i*6, (sum[i]*(height-100)*scale)*(i+1)/8+180, i*6, (-sum[i]*(height-100)*scale)*(i+1)/8+180 );
  }
}