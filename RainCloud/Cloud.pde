class Cloud {
  PVector position;
  ArrayList<Drop> drops;
  boolean spawning = true;
  float w;
  float h;
  Circle[] circles;

  Cloud(PVector pos) {
    position = pos;
    drops = new ArrayList<Drop>();
    w = 130;
    h = 20;
    circles = new Circle[5];
    PVector p = pos.copy();
    circles[0] = new Circle(p.x-w/2, p.y+h+3, 20);
    circles[1] = new Circle(p.x-w/4, p.y+h-7, 30);
    circles[2] = new Circle(p.x+w/8, p.y+h-17, 40);
    circles[3] = new Circle(p.x+(w/6*3)-10, p.y+h/2, 10);
    circles[4] = new Circle(p.x+w/2, p.y+(h/3*3)+8, h/4*3);
  }

  void spawnDrop() {
    Drop d = new Drop();
    d.position = PVector.add(position, new PVector(random(-65, 65), random(15, 20)));
    d.push();
    drops.add(d);
  }

  void drawDrops() {
    for (Drop d : drops) {
      if (d.offScreen() && spawning) {
        spawning = false;
        break;
      }
    }
    if (spawning) {
      spawnDrop();
    }
    for (Drop d : drops) {
      d.draw();
    }
  }

  void draw() {
    PVector p = position.copy();
    pushStyle();
    drawDrops();
    fill(255);
    stroke(255);
    rectMode(CENTER);
    rect(p.x, p.y+p.y/3*2, w, h);
    for (Circle c : circles) {
      c.draw();
    }
    popStyle();
  }
}

class Circle {
  float x, y, r;

  Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  void draw() {
    pushStyle();
    fill(255);
    stroke(255);
    ellipse(x, y, r*2, r*2);
    popStyle();
  }
}