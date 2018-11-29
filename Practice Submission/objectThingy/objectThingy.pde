Thingy thing = new Thingy(20, 30);

void setup(){
  fullScreen();
  frameRate(60);
}

void draw() {
  background(0);
  
  thing.show();
  thing.move();
}
