//By Paolo Lara
class Object
{
  int x, y;
  
  Object(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
 void print()
 {
   rect(x, y, 12, 20);
 }
   
 void move()
 {
   x = mouseX;
   y = mouseY;
 }
}
