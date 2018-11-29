class Thingy {
  int xLocation, yLocation;
  int length = 100;
  int width = 100;
  
  Thingy (int x, int y)
  {
    xLocation = x;
    yLocation = y;
  }
  
  void show() {
    rect(xLocation, yLocation, length, width); 
  }
  
  void move() {
    xLocation = mouseX;
    yLocation = mouseY;
  }
}
