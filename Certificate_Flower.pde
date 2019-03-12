float x, y;
float x2, y2;
float x3, y3;
float x4, y4;
float a = 16;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
}

void draw() {
  background(255);
  fill(0);
  //dance();

  for (float i = 0; i <2*PI; i+= PI/8192) {


    x = sin(i*a)*(160+56*sin(i*(4)))*cos(i);
    y = sin(i*a)*(160+56*sin(i*(4)))*sin(i);
    ellipse(x+400, y+400, 1, 1);

    x2 = sin((i+PI/64)*a)*(160+56*sin(i*(4)))*cos(i);
    y2 = sin((i+PI/64)*a)*(160+56*sin(i*(4)))*sin(i);
    ellipse(x2+400, y2+400, 1, 1);

    x3 = sin((i+PI/32)*a)*(160+56*sin(i*(4)))*cos(i);
    y3 = sin((i+PI/32)*a)*(160+56*sin(i*(4)))*sin(i);
    ellipse(x3+400, y3+400, 1, 1);

    x4 = sin((i+3*PI/64)*a)*(160+56*sin(i*(4)))*cos(i);
    y4 = sin((i+3*PI/64)*a)*(160+56*sin(i*(4)))*sin(i);
    ellipse(x4+400, y4+400, 1, 1);

    x = (240+56*sin((i+3*PI/16)*(8)))*cos(i);
    y = (240+56*sin((i+3*PI/16)*(8)))*sin(i);
    ellipse(x+400, y+400, 1, 1);
  }
  fill(255);
  //ellipse(400,400,145,145);

  for (float i = 0; i < 2*PI; i+=PI/64) {
    x = cos(i)*(75+5*sin(i*4096));
    y = sin(i)*(75+5*sin(i*4096));
    ellipse(x+400, y+400, 3, 3);
  }
}

void dance() {
  int a2 = round(random(255));
  int b = round(random(255));
  int c = round(random(255));
  fill(a2, b, c);
}