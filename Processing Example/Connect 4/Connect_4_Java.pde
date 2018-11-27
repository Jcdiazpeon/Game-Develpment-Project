boolean player1 = true;
String winner;;
int rows = 6, columns = 7;
Button[][] buttons = new Button[rows][columns];
String[][] board = new String [rows][columns];
int size = 100;

void setup(){
  size(700, 600);
  frameRate(30);
  initArray();
}

void draw(){
  for(Button[] tempRow: buttons){
    for(Button temp: tempRow){
      temp.show();
      fill(0);
      if(winner == null){
        temp.checkIsPressed();
        checkWinner();
      }
      else{
        textSize(100);
        fill(255);
        text(winner + " won!", 100, 100);
      }
    }
  }
}

void initArray(){
  for(int row = 0; row < rows; row++){
    for(int column = 0; column < columns; column++){
      //makes the names for the buttons
      String buttonName = "button" + row + "_" + column;
    
      //creates buttons and adds then to array list
      buttons[row][column] = new Button(buttonName, column*size, row*size, size);
    }
  }
}

void checkWinner(){
  checkDiagonal();
  checkVertical();
  checkHorizontal();
}

void checkDiagonal(){
  for(int r = 0; r < rows-3; r++){
    for(int c = 0; c < columns; c++){
      if(board[r][c] != null){
        String colour = board[r][c];
        if(c+3 < columns && board[r+1][c+1] == colour && board[r+2][c+2] == colour&& board[r+3][c+3] == colour)
          winner = colour;
        else if(c-3 > 0 && board[r+1][c-1] == colour && board[r+2][c-2] == colour && board[r+3][c-3] == colour)
          winner = colour;
      }
    }
  } 
}

private void checkVertical(){
  for(int r = 0; r < rows-3; r++){
    for(int c = 0; c < columns; c++){
      if(board[r][c] != null){
        String colour = board[r][c];
        if(board[r+1][c] == colour && board[r+2][c] == colour && board[r+3][c] == colour)
          winner = colour;
      }      
    }
  }      
}

private void checkHorizontal(){
  for(int r = 0; r < rows; r++){
    for(int c = 0; c < columns-3; c++){
      if(board[r][c] != null){
        String colour = board[r][c];
        if(board[r][c+1] == colour && board[r][c+2] == colour && board[r][c+3] == colour)
          winner = colour;
      }      
    }
  }   
}
