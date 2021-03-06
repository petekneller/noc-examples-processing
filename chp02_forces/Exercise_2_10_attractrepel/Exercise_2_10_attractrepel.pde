// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[20];

Attractor a;

float g = 1;

void setup() {
  size(640,360);
  a = new Attractor();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(4,12),random(width),random(height)); 
  }
}

void draw() {
  background(255);

  a.display();
  a.drag();
  a.rollover(mouseX, mouseY);

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].repel(movers[i]);
        movers[i].applyForce(force);
      }
    }

    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    movers[i].display();
  }
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a.stopDragging();
}