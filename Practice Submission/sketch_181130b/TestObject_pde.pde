class TestObject
{
  String name;
  int xLocation, yLocation;
  
  TestObject(String n, int x, int y)
  {
    name = n;
    xLocation = x;
    yLocation = y;
  }
  
  void show()
  {
    rect(xLocation, yLocation, 50, 50, 4);
  }
  
  void move ()
  {
   xLocation = mouseX;
   yLocation = mouseY;
  }
}
