float xPos = 10;
float yPos = 10;

float xVel = 2;
float yVel = 3;

int boardSize = 500;
int rectSize = 15;
int numRects = 50;

float[][] squares = new float[numRects][4];

void setup(){
  size(500,500);
  background(255);
  
  for(int i = 0; i < squares.length; i++){
    squares[i][0] = 10+(boardSize-20)/numRects*i;
    squares[i][1] = 10+(boardSize-20)/numRects*i;
    squares[i][2] = (float)(Math.random()*3+1);
    squares[i][3] = (float)(Math.random()*3+1);
  }
  
}

void draw(){
  background(255);
  
  for(int i = 0; i < squares.length; i++){
    if(squares[i][0] <= 0 || squares[i][0] >= boardSize-rectSize){
      squares[i][2] *= -1;
    }
    if(squares[i][1] <= 0 || squares[i][1] >= boardSize-rectSize){
      squares[i][3] *= -1;
    }
    
    squares[i][0] += squares[i][2];
    squares[i][1] += squares[i][3];
    
    fill(0);
    rect(squares[i][0], squares[i][1], rectSize, rectSize);
  }
  
  for(int i = 0; i < squares.length; i++){
    for(int j = i; j <squares.length; j++){
      if(Math.abs((squares[i][0] - squares[j][0])) <= rectSize && Math.abs(squares[i][1] - squares[j][1]) <= rectSize){
        if( Math.abs(squares[i][0] - squares[j][0]) > Math.abs(squares[i][1] - squares[j][1])){
          squares[i][2] += squares[j][2];
          squares[j][2] = squares[i][2] - squares[j][2];
          squares[i][2] -= squares[j][2];
        }
        if( Math.abs(squares[i][0] - squares[j][0]) < Math.abs(squares[i][1] - squares[j][1])){
          squares[i][3] += squares[j][3];
          squares[j][3] = squares[i][3] - squares[j][3];
          squares[i][3] -= squares[j][3];
        }
      }
    }
  }
}
