class Button {
 
  String name;
  int xLocation, yLocation, size, counter = 0;
  color c = color(150, 150, 150);
  boolean black;
  boolean used = false;
  
  Button(String n, int x,int y, int s) {
    name = n;
    xLocation = x;
    yLocation = y;
    size = s;
  }
  
  void show() {
    fill(c);
    stroke(255);
    rect(xLocation, yLocation, size, size);
  }
  
  void checkIsPressed() {
    if(mouseX >= (xLocation) && mouseX <= (xLocation + size) && mouseY >= (yLocation) && mouseY <= (yLocation + size)
    && mousePressed == true){
      counter++;
      getColor();
    }
  }
  
  private void getColor(){
    if(checkIsBottom() == true){
      if(used == false){ //not used before
        if(player1){
          c = color(0,0,0);//black
          black = true;
          board[yLocation/size][xLocation/size] = "black";  //updates board
        }
        else{
          c = color(200,0,0);//red
          black = false;
          board[yLocation/size][xLocation/size] = "red";  //updates board
        }
        player1 = !player1; //Switches turns
        used = true;
      }
    }
  }
  
  private boolean checkIsBottom(){  //checks if the tile is the lowest tile possible
    boolean taken = false;
    if(this.yLocation < (rows - 1) * size) // is not first tile
      taken = checkIsUsed(xLocation, yLocation + size); //checks tile underneath
    else
      taken = true;
    return taken;
  }
  
  private boolean checkIsUsed(int x, int y){
    boolean t = false;
    
    for(Button[] tempRow : buttons){
      for(Button temp: tempRow){
        if(temp.xLocation == x && temp.yLocation == y){
          t = temp.used;
          break;
        }
      }
    }
      return t;
  }
}
