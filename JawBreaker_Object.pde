class JawBreaker{
  
  String name = "jawBreaker";
  int xLocation, yLocation;
  int l = 100; //lenght
  int w = 100; //width
  
  JawBreaker(int initialX, int initialY){
    xLocation = initialX;
    yLocation = initialY;
  }
  
  void show(){
    fill(250, 0, 0); // set the rect color (optional)
    rectMode(CENTER); // draws the rect starting from the center (optional)
    rect(xLocation, yLocation, l, w);
  }
  
  void move(){
    xLocation = mouseX;
    yLocation = mouseY;
  }
  
}
