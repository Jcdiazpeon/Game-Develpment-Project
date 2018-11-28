public class Sprite
{
  private int x = mouseX;
  private int y = mouseY;
  private int size = 25;
  
//creates a sprite using the location of the mouse
  public void display()
  {
    x = mouseX;
    y = mouseY;
    ellipse(x,y,size, size);
  }
}
