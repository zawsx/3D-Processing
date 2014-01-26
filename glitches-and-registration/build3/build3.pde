int redBuffer;
int blueBuffer;
int greenBuffer;
PImage display;
color pixel;
int iterationCount;

void setup(){

  iterationCount=0;
  redBuffer = int(random(pow(2,32)));
  greenBuffer =  int(random(pow(2,32)));
  blueBuffer =  int(random(pow(2,32)));
  display = createImage(100,100,RGB);
  frameRate(15);

  size(display.width,display.height); 

}

void draw(){

  generatePixels();
  image(display,0,0);
  display.save("frameOutput_"+nf(iterationCount,4)+".png");
  if (iterationCount < 0){
    exit();
  }

  iterationCount++;

}

void generatePixels(){
  for (int i=0; i<display.pixels.length;i++){
    redBuffer=shift(redBuffer, 26, 2);
    greenBuffer=shift(greenBuffer, 27, 26);
    blueBuffer=shift(blueBuffer, 9, 31);
    pixel = color(int(byte(redBuffer)),int(byte(greenBuffer)),int(byte(blueBuffer)));
    display.pixels[i]=pixel;
  }

  display.updatePixels();

}

int shift(int input, int tapPos1, int tapPos2){
  int register = input << 1 ^ ((input >> tapPos1 & 1) ^ (input >> tapPos2 & 1));
  return register;
}