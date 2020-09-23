int xCount = 15;
int yCount = 30;
//unit size
int h = 30;
int color1, color2;
float[] angle;

void setup() {
  size(450, 900);
  //background(255);
  paint();
  rearrange();
}

void paint() {
  color1 = color(random(255),random(255),random(255));
  color2 = color(random(255),random(255),random(255));
}

void rearrange() {
  for(int i=0; i<xCount; i++) {
    angle[i] = [];
    for (int j=0; j<yCount; j++) {
      angle[i][j] = random([0,0.25,0.5,0.75])*2*PI;
    }
  }
}

//refresh drawing
void mousePressed() {
  paint();
  rearrange();
}

void keyPressed() {
  if (key == 'r') {
    paint();
    rearrange();
  } else if (key == 'c') {
    paint();
  } else if (key == 'a') {
    rearrange();
  }
}
    
void draw() {
  noStroke();
  
  for(int i=0; i<xCount; i++) {
    for(int j=0; j<yCount; j++) {
      push();
      translate(i*h+h/2,j*h+h/2);
      rotate(angle[i][j]);
      fill(color1);
      beginShape();
      vertex(-h/2,-h/2);
      vertex(-h/2,h/2);
      vertex(h/2,-h/2);
      endShape(CLOSE);
      fill(color2);
      beginShape();
      vertex(h/2,h/2);
      vertex(h/2,-h/2);
      vertex(-h/2,h/2);
      endShape(CLOSE);
      pop();
    }
  }
  
}
