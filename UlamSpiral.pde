import processing.pdf.*;

int val = 1;
float xpos = 0;
float ypos = 0;

int steps = 1;
int state = 0;

int w = 0;

float scl = 0.2;

void setup() {
  background(0);
  size(800, 800, PDF, "Ulam's Spiral.pdf");
  textAlign(CENTER);
}

void draw() {

  translate(width/2, height/2);
  scale(scl);

  for (int i=0; i<steps; i++) {
    switch(state) {
    case 0: 
      xpos+=10; 
      break;
    case 1: 
      ypos-=10; 
      break;
    case 2: 
      xpos-=10; 
      break;
    case 3: 
      ypos+=10; 
      break;
    }
    val++;
    if (prime(val)) {
      circle(xpos, ypos, 10);
    }
  }
  evalDir();
  
  if(w == 3*width){
    println("finished");
    exit();
  }
}



boolean prime(int n) {
  for (int i=2; i<=sqrt(n); i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void evalDir() {
  state++;
  
  if(state == 4){
    w+=10;
  }
  
  state%=4;
  if (frameCount % 2 == 0) {
    steps++;
  }
}
