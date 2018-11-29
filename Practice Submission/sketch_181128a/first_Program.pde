class CircleMouse
{
 String name = "CircleMouse"; 
 int xLoc, yLoc;
 int rad = 50;

 
 void display()
 {
  xLoc = mouseX;
  yLoc = mouseY;
  float color1 = map(mouseX, 0, width, 0, 255);
  float color2 = map(mouseY, 0, height, 0, 255);
  fill(color1, ((xLoc - yLoc) / 2), color2);
  ellipse(xLoc, yLoc, rad, rad);
 }
}
