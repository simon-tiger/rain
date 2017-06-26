// Rain Cloud Simulation
// (255, 255, 255)
// (0, 191, 255): background

Cloud c;

void setup() {
  size(640, 360);
}

void draw() {
  background(0, 191, 255);
  if (c != null) {
    c.draw();
  } else {
    textSize(22);
    textAlign(CENTER);
    text("CLICK TO BEGIN", width/2, height/2);
  }
}

void mousePressed() {
  c = new Cloud(new PVector(width/2, 50));
}