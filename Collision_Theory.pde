int numA = 10;
int massA = 1;
int radiusA = 10;
ArrayList<float[]> listA = new ArrayList<float[]>();

int numB = 10;
int massB = 1;
int radiusB = 10;
ArrayList<float[]> listB = new ArrayList<float[]>();

void setup(){
  size(500,500);
  background(255);
  
  for(int i = 0; i < numA; i++){
    float[] reactant = {20+i*(460/numA), 20, (float)(Math.random()*2)+0.5, (float)(Math.random()*2)+0.5};
    listA.add(reactant);
  }
  
  for(int i = 0; i < numB; i++){
    float[] reactant = {20+i*(460/numB), 480, 1, 1};
    listB.add(reactant);
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < listA.size(); i++){
    if(listA.get(i)[0] <= radiusA || listA.get(i)[0] >= 500-radiusA) listA.get(i)[2] *= -1;
    if(listA.get(i)[1] <= radiusA || listA.get(i)[1] >= 500-radiusA) listA.get(i)[3] *= -1;
    
    for(int j = i + 1; j < listA.size(); j++){
      if(sqrt(pow(listA.get(i)[0]-listA.get(j)[0],2)+pow(listA.get(i)[1]-listA.get(j)[1],2)) <= 2*radiusA){
        float ixVel = listA.get(i)[0];
        float iyVel = listA.get(i)[1];
        float jxVel = listA.get(j)[0];
        float jyVel = listA.get(j)[1];
        
        listA.get(i)[2] = ixVel + (abs(listA.get(i)[0]-listA.get(j)[0])/(2*radiusA)) * sqrt(pow(jxVel,2)+pow(jyVel,2));
        listA.get(i)[3] = iyVel + (abs(listA.get(i)[1]-listA.get(j)[1])/(2*radiusA)) * sqrt(pow(jxVel,2)+pow(jyVel,2));
        
        listA.get(j)[2] = jxVel + (abs(listA.get(i)[0]-listA.get(j)[0])/(2*radiusA)) * sqrt(pow(ixVel,2)+pow(iyVel,2));
        listA.get(j)[3] = jyVel + (abs(listA.get(i)[1]-listA.get(j)[1])/(2*radiusA)) * sqrt(pow(ixVel,2)+pow(iyVel,2));

        while(sqrt(pow(listA.get(i)[0]-listA.get(j)[0],2)+pow(listA.get(i)[1]-listA.get(j)[1],2)) <= 2*radiusA){
          listA.get(i)[0] += (listA.get(i)[0]-listA.get(j)[0])/10;
          listA.get(i)[1] += (listA.get(i)[1]-listA.get(j)[1])/10;
          listA.get(j)[0] += (listA.get(j)[0]-listA.get(i)[0])/10;
          listA.get(j)[1] += (listA.get(j)[1]-listA.get(i)[1])/10;
        }
      }
    }
    
    
    listA.get(i)[0] += listA.get(i)[2];
    listA.get(i)[1] += listA.get(i)[3];
    
    noStroke();
    fill(0,100,200);
    ellipse(listA.get(i)[0], listA.get(i)[1], 2*radiusA, 2*radiusA);
  } 
}
