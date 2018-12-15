import java.util.*;

public class Guns
{
  
  int size = 11;
  boolean up = false;
  boolean down = false;
  boolean right = false;
  boolean left = false;
  int x = 0;
  int y = 0;

  void display()//throws InterruptedException
  {
    if(key == 'w')
    {
       y--;
    }
    if(key == 's')
    {
      y++;
    }
    if(key == 'd')
    {
      x++;
    }
    if(key == 'a')
    {
      x--;
    }
    if(key == CODED)
    {
      if(keyCode == UP)
      {
        rect(300 + x, 289 + y, size, size * 2);
        up = true;
        down = false;
        right = false;
        left = false;
        int dot = 284 + y;
        int xLoc = 303 + x;
      }
      else if(keyCode == DOWN)
      {
        rect(300 + x, 300 + y, size, size * 2);
        down = true;
        up = false;
        right = false;
        left = false;
      }
      else if(keyCode == RIGHT)
      {
        rect(300 + x, 300 + y, size * 2, size);
        right = true;
        down = false;
        up = false;
        left = false;
      }
      else if(keyCode == LEFT)
      {
        rect(289 + x, 300 + y, size * 2, size);
        left = true;
        down = false;
        right = false;
        up = false;
        
      }
      if(keyCode == SHIFT)
      {
        if(up == true)
        {
          rect(300 + x, 289 + y, size, size * 2);
          for(int i = 284; i > 0 - y; i = i - 5)
          {
            rect(303 + x, i + y, 5, 5);
            //Thread.sleep(2000);
          }
          /*int dot = 284 + y;
          int xLoc = 303 + x;
          int time = millis();
          while(dot > 0)
          {
            if(time + 500 == millis())
            {
              rect(xLoc, dot, 5, 5);
              dot = dot - 5;
              time = millis();
            }
          }*/
        }
        if(down == true)
        {
          rect(300 + x, 300 + y, size, size * 2);
          for(int i = 322; i < 700 - y; i = i + 5)
          {
            rect(303 + x, i + y, 5, 5);
            //Thread.sleep(2000);
          }
        }
        else if(right == true)
        {
          rect(300 + x, 300 + y, size * 2, size);
          for(int i = 322; i < 1000 - x; i = i + 5)
          {
            rect(i + x, 303 + y, 5, 5);
            //Thread.sleep(2000);
          }
        }
        else if(left == true)
        {
          rect(289 + x, 300 + y, size * 2, size);
          for(int i = 284; i > 0 - x; i = i - 5)
          {
            rect(i + x, 303 + y, 5, 5);
            //Thread.sleep(2000);
          }
        }
      }
    }
  }
}
