float x;
float y;
float easing = 1;

void setup() {
  size(250, 250); 
  noStroke();  
}

void draw() { 
  background(51);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  rect(x, y, 12, 12);
}
