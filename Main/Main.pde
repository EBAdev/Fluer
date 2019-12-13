ArrayList<Flue> flueListe = new ArrayList<Flue>();
int time, seconds;

void setup() {
  size(500, 500);

  textAlign(CENTER);
  textSize(20);
  time = millis() + 5000;
}

void draw() {
  background(0);
  for (int i=0; i<flueListe.size(); i++) {
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.chase();
    f.kanter();
  }
  
  noCursor();
  strokeWeight(5);
  stroke(255);
  fill(255, 0, 0);
  ellipse (mouseX, mouseY, width/20, width/20);
  noStroke();
  fill(0, 0, 255);
  ellipse (mouseX, mouseY, width/30, width/30);

  fill(64);
  noStroke();
  arc( 25, 25, 50, 50, 0, map(time-millis(), 0, 5000, 0, TWO_PI));
  fill(255);
  textAlign(CENTER);
  text(seconds, 25, 30);
  
  if ( millis() > time ) {
    flueListe.add(new Flue(random(1,1.8)));
    seconds++;
    time = millis() + 5000;
  }
}

void keyPressed() {
  if (key == 'e') {
    flueListe.add(new Flue(1.8));
  } else {
    flueListe.add(new Flue());
  }
}

void mousePressed() {
  flueListe.add(new Flue(mouseX, mouseY));
}
