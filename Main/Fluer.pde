class Flue {

  PVector position= new PVector(random(width), random(height));
  PVector velocity = new PVector(0, 0);
  PVector acceleration= new PVector(0, 0);
  float Heading = 0; 
  float scale = 1.2;

  Flue(float a) {
    position.x  = random(0, height);
    position.y  = random(0, width);
    scale = a;
  }

  void chase() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(position);
    mouse.setMag(0.5);
    acceleration=mouse;
    Heading = mouse.heading();
    velocity.add(acceleration);
    position.add(velocity);
    velocity.mult(0.982);
    velocity.limit(5);
  }

  void tegnFlue() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(Heading);
    scale(scale);
    fill(200);
    stroke(0);
    strokeWeight(1);
    ellipse(0, 0, 20, 8);
    ellipse(0, 0-8, 15, 10);
    ellipse(0, 0+8, 15, 10);
    fill(255);
    ellipse(0+6, 0, 8, 8);
    popMatrix();
  }

  void kanter() {
    if ((position.x > width) || (position.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((position.y > height) || (position.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }

  void kill() {
    if ((position.x > mouseX) && (position.x < (mouseX+d+5)) && (position.y > mouseY) && (position.y < (mouseY+d+5))) {
      textSize(26);
      text("You survived for " + millis()/1000 + " seconds", width/2, height/2);
      noLoop();
    }
  }
}
