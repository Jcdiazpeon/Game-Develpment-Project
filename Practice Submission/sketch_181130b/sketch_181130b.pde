  TestObject testO = new TestObject("ding", 15, 15);
  
  void setup()
  {
   size(500,500); 
  }
  
  void draw()
  {
   testO.show();
   testO.move();
  }
