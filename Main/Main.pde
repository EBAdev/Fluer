ArrayList<Flue> flueListe = new ArrayList<Flue>();
int time, seconds;
float d = 20;

void setup() {
  size(500, 500);

  textAlign(CENTER);
  textSize(20);
  time = millis() + 1000;
}

void draw() {
  background(0);
  for (int i = 0; i < flueListe.size(); i++) {
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.chase();
    f.kanter();
    f.kill();
   
    for (int j = 0; j < flueListe.size(); j++) {
      Flue k = flueListe.get(j);
      
      if (f != k) {
        PVector g = PVector.sub(f.position,k.position);
        float distanceBetween = g.mag();
        
        if (distanceBetween <= 25) {
         f.velocity.add(g.setMag(2));
        }
      }
    }
  }

  noCursor();
  strokeWeight(5);
  stroke(255);
  fill(255, 0, 0);
  ellipse (mouseX, mouseY, d+5, d+5);
  noStroke();
  fill(0, 0, 255);
  ellipse (mouseX, mouseY, d, d);

  fill(64);
  noStroke();
  arc( 25, 25, 50, 50, 0, map(time-millis(), 0, 1000, 0, TWO_PI));
  fill(255);
  textAlign(CENTER);
  text(seconds, 25, 30);

  if ( millis() > time ) {
    flueListe.add(new Flue(random(1, 1.8)));
    seconds++;
    time = millis() + 1000;
  }
}
