Guns blaster = new Guns();

void setup()
{
  size(1000, 700);
}
int x = 0;
int y = 0;
void draw()
{
  background(0);
  blaster.display();
  //player
  ellipse(306 + x, 306 + y, 21, 21);
  //movement with wasd keys
  if(key == 'w')
  {
     y--;
     key = 0;
  }
  if(key == 's')
  {
    y++;
    key = 0;
  }
  if(key == 'd')
  {
    x++;
   key = 0;
  }
  if(key == 'a')
  {
    x--; 
    key = 0;
  }
}
