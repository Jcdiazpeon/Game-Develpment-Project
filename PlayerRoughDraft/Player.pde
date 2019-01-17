//*****Note: This is a very early draft for the player class. I will add methods to the class if anyone needs them. Right now,
//the only aspect of the player class that can be changed is speed.*****
class Player
{
  private float x;
  private float y;
  private int speed;
  private int rectHeight = 50;
  private int rectWidth = 50;
  
  //constructor for the Player class
    Player(float xPos, float yPos, int s)
    {
    x = xPos;
    y = yPos;
    speed = s;
    }
 
 //method to display the object on screen
  void display()
  {
  rectMode(CENTER);
  rect(x,y,rectWidth,rectHeight);
  }

//moves the object based on keyboard input (ONLY WASD IS WORKING FOR NOW)
  void movement(char c)
  {
    if(c == 'w' && x >= 20 && y >= 20)
    {
     y -= speed;
    }
    
     if(c == 'a' && x >= 20 && y >= 20)
    {
     x -= speed;
    }
    
      if(c == 's' && x >= 20 && y >= 20)
    {
     y += speed;
    }
    
      if(c == 'd' && x >= 20 && y >= 20)
    {
     x += speed;
    }
    
    //***********************************************
    //this block of code moves the object across the screen like Pac-Man if an outer-limit is reached
    if((rectWidth/2) - x >= 0)
    {
    x = 475;
    }
    
    if((rectHeight/2) - y >= 0)
    {
    y = 475;
    }
    
    if(x - (rectWidth/2) > 475)
    {
    x = 26;
    }
    
     if(y - (rectHeight/2) > 475)
    {
    y = 26;
    }
    //***********************************************
   
  }
  //allows the user to change speed
  void setSpeed(int i)
  {
  speed = i;
  }
  
}
