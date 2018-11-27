class Piece{
  String type, colour, name;
  int steps;
  PImage image;
  int x, y;
  int xLocation, yLocation;
  int[] initialInfo = new int[3];
  boolean pressed = false;
  boolean availableMoves[][] = new boolean[8][8];
  color red = color(255, 0, 0, 180), green = color(0, 220, 0, 130);
  
  Piece(String t, String c, int xLocation, int yLocation){
    type = t;
    colour = c;
    x = xLocation;
    y = yLocation;
    initialInfo[0] = x;
    initialInfo[1] = y;
    
    if(colour.equals("red"))
      initialInfo[2] = 0;
    else
      initialInfo[2] = 1;
      
    name = colour + " " + type + ".jpg";
    image = loadImage(name);
  }
  
  void show(){    
    imageMode(CORNER);
    image.resize(60, 60);
    xLocation = x * 80 +10;
    yLocation = y * 80 +10;
    image(image, xLocation, yLocation);    
  }
  
  void update(){
    if(mousePressed == true){
      if(mouseX > xLocation && mouseX < xLocation+60 && mouseY > yLocation && mouseY < yLocation+60){
           pressed = !pressed;
           delay(100);
         }
    }
    
    if(pressed){
      fill(100, 100, 255);
      rect(xLocation -10, yLocation-10, 80, 80);
      showMoves();
      move();
    }
    board[x][y] = initialInfo;
  }
  
  void showMoves(){
    switch(type){
      case "pawn": 
        if(initialInfo[1] == y)
          checkUp(2);
        else
          checkUp(1);
        
        checkTopLeft(1);
        checkTopRight(1);
        checkTrade();
        break;
        
      case "rook":
        checkUp(8);
        checkDown(8);
        checkLeft(8);
        checkRight(8);
        break;
        
      case "bishop":
        checkTopLeft(8);
        checkTopRight(8);
        checkButtomLeft(8);
        checkButtomRight(8);
        break;
        
      case "queen": 
        checkUp(8);
        checkDown(8);
        checkLeft(8);
        checkRight(8);
        checkTopLeft(8);
        checkTopRight(8);
        checkButtomLeft(8);
        checkButtomRight(8);
        break;
        
      case "king": 
        checkUp(1);
        checkDown(1);
        checkLeft(1);
        checkRight(1);
        checkTopLeft(1);
        checkTopRight(1);
        checkButtomLeft(1);
        checkButtomRight(1);
        break;
        
      case "knight":
        checkKnight();
        break;
    }
  }
  
  void move(){
    if(mousePressed == true){
      int px = mouseX/80, py = mouseY/80;
      
      if(py <= 7 && availableMoves[px][py]){  //Clicked available spot
        previousBoard = board;  //saves a copy
        board[x][y] = null;
        x = px;
        y = py;
        
        if(board[px][py] != null){ //removes the opposing piece
          for(Piece[] a: pieces){
            for(Piece temp: a){
              if(temp != null && temp.x == this.x && temp.y == this.y && temp != this){ //<>//
                previousPieces = pieces;  //saves a copy
                pieces[temp.initialInfo[1]][temp.initialInfo[0]] = null; //<>//
                board[x][y] = null;
              }
            }
          }
        }
        for(int i = 0; i < 8; i++){  //Wipes available spots
          for(int j = 0; j <8; j++){
            availableMoves[i][j] = false;
          }
        }
      }
    }
  }

  
  void checkUp(int moves){
    boolean blocked = false;
    int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newY = y-i-1;
      
      if(colour.equals("red") && newY >= 0){
        if(!blocked && board[newX][newY] == null){  //Is free
          fill(green);
          rect(newX*80, newY*80, 80, 80);
          availableMoves[newX][newY] = true;
        }
        else if(!blocked){
          blocked = true;
          
          if(!type.equals("pawn")){
            if(board[newX][newY][2] != 0){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
      else{
        newY = y+i+1;
        
        if(colour.equals("black") && newY <= 7){
          if(!blocked && board[newX][newY] == null){ //is free
            fill(green);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
          else if(!blocked){
            blocked = true;
            
            if(!type.equals("pawn")){
              if(board[newX][newY][2] != 1){ //is able to eat
                fill(red);
                rect(newX*80, newY*80, 80, 80);
                availableMoves[newX][newY] = true;
              }
            }
          }
        }
      }
    }
  }
  
  void checkDown(int moves){
    boolean blocked = false;
    int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newY = y+i+1;
      
      if(colour.equals("red") && newY <= 7){
        if(!blocked && board[newX][newY] == null){  //Is free
          fill(green);
          rect(newX*80, newY*80, 80, 80);
          availableMoves[newX][newY] = true;
        }
        else if(!blocked){
          blocked = true;
          
          if(board[newX][newY][2] != 0){ //is able to eat
            fill(red);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
      }
      else{
        newY = y-i-1;
        
        if(colour.equals("black") && newY >= 0){
          if(!blocked && board[newX][newY] == null){ //is free
            fill(green);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
          else if(!blocked){
            blocked = true;
            
            if(board[newX][newY][2] != 1){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
    }
  }
  
  void checkLeft(int moves){
    boolean blocked = false;
    int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newY = y;
      newX = x-1-i;
      
      if(colour.equals("red") && newX >= 0){
        if(!blocked && board[newX][newY] == null){  //Is free
          fill(green);
          rect(newX*80, newY*80, 80, 80);
          availableMoves[newX][newY] = true;
        }        
        else if(!blocked){
          blocked = true;
          
          if(board[newX][newY][2] != 0){ //is able to eat
            fill(red);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
      }
      else{
        newY = y;
        newX = x+1+i;
        
        if(colour.equals("black") && newX <= 7){
          if(!blocked && board[newX][newY] == null){ //is free
            fill(green);
            rect(newX*80, (newY)*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
          else if(!blocked){
            blocked = true;
            
            if(board[newX][newY][2] != 1){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
    }
  }
  
  void checkRight(int moves){
    boolean blocked = false;
    int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newY = y;
      newX = x+1+i;
      
      if(colour.equals("red") && newX <= 7){
        if(!blocked && board[newX][newY] == null){  //Is free
          fill(green);
          rect(newX*80, newY*80, 80, 80);
          availableMoves[newX][newY] = true;
        }        
        else if(!blocked){
          blocked = true;
          
          if(board[newX][newY][2] != 0){ //is able to eat
            fill(red);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
      }
      else{
        newY = y;
        newX = x-1-i;
        
        if(colour.equals("black") && newX >= 0){
          if(!blocked && board[newX][newY] == null){ //is free
            fill(green);
            rect(newX*80, (newY)*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
          else if(!blocked){
            blocked = true;
            
            if(board[newX][newY][2] != 1){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
    }
  }
  
  void checkTopLeft(int moves){
    boolean blocked = false;
    int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newX = x-1-i;
      newY = y-1-i;
      if(colour.equals("red") && newX >= 0 && newY >= 0){
        if(!blocked && board[newX][newY] == null){  //Is free
          if(!type.equals("pawn")){
            fill(green);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
        else if(!blocked){
          blocked = true;
          
          if(board[newX][newY][2] != 0){ //is able to eat
            fill(red);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
      }
      else{
        newX = x+1+i;
        newY = y+1+i;
        
        if(colour.equals("black") && newX <= 7 && newY <= 7){ //Is black
          if(!blocked && board[newX][newY] == null){ //is free
            if(!type.equals("pawn")){
              fill(green);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
          else if(!blocked){
            blocked = true;
            
            if(board[newX][newY][2] != 1){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
    }
  } 
  
  void checkTopRight(int moves){
    boolean blocked = false;
     int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newX = x+1+i;
      newY = y-1-i;
      
      if(colour.equals("red") && newX <= 7 && newY >= 0){
        if(!blocked && board[newX][newY] == null){  //Is free
          if(!type.equals("pawn")){
            fill(green);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
        else if(!blocked){
          blocked = true;
          
          if(board[newX][newY][2] != 0){ //is able to eat
            fill(red);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
      }
      else{
        newX = x-1-i;
        newY = y+1+i;
        
        if(colour.equals("black") && newX >= 0 && newY <= 7){ //Is black
          if(!blocked && board[newX][newY] == null){ //is free
            if(!type.equals("pawn")){
              fill(green);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
          else if(!blocked){
            blocked = true;
            
            if(board[newX][newY][2] != 1){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
    }
  }
  
  void checkButtomLeft(int moves){
    boolean blocked = false;
    int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newX = x-1-i;
      newY = y+1+i;
      if(colour.equals("red") && newX >= 0 && newY <= 7){
        if(!blocked && board[newX][newY] == null){  //Is free
          if(!type.equals("pawn")){
            fill(green);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
        else if(!blocked){
          blocked = true;
          
          if(board[newX][newY][2] != 0){ //is able to eat
            fill(red);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
      }
      else{
        newX = x+1+i;
        newY = y-1-i;
        
        if(colour.equals("black") && newX <= 7 && newY >= 0){ //Is black
          if(!blocked && board[newX][newY] == null){ //is free
            if(!type.equals("pawn")){
              fill(green);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
          else if(!blocked){
            blocked = true;
            
            if(board[newX][newY][2] != 1){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
    }
  } 
  
  void checkButtomRight(int moves){
    boolean blocked = false;
     int newX = x, newY = y;
    
    for(int i = 0; i < moves; i++){
      newX = x+1+i;
      newY = y+1+i;
      
      if(colour.equals("red") && newX <= 7 && newY <= 7){
        if(!blocked && board[newX][newY] == null){  //Is free
          if(!type.equals("pawn")){
            fill(green);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
        else if(!blocked){
          blocked = true;
          
          if(board[newX][newY][2] != 0){ //is able to eat
            fill(red);
            rect(newX*80, newY*80, 80, 80);
            availableMoves[newX][newY] = true;
          }
        }
      }
      else{
        newX = x-1-i;
        newY = y-1-i;
        
        if(colour.equals("black") && newX >= 0 && newY >= 0){ //Is black
          if(!blocked && board[newX][newY] == null){ //is free
            if(!type.equals("pawn")){
              fill(green);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
          else if(!blocked){
            blocked = true;
            
            if(board[newX][newY][2] != 1){ //is able to eat
              fill(red);
              rect(newX*80, newY*80, 80, 80);
              availableMoves[newX][newY] = true;
            }
          }
        }
      }
    }
  }
  
  void checkKnight(){
    int newX = x, newY = y;
    
    for(int tempX = -2; tempX <= 2; tempX++){
      if(tempX == 0)
        continue;
        
      newX = x + tempX;
      if(tempX % 2 == 0){
        for(int tempY = -1; tempY <= 1; tempY += 2){
          newY = y + tempY;
          
          if(newX >= 0 && newX <= 7 && newY >= 0 && newY <= 7){
            if(board[newX][newY] == null){
              fill(green);
              availableMoves[newX][newY] = true;
            }
            else if(board[newX][newY][2] == 0){
              if(colour.equals("red"))
                continue;
              else{
                fill(red);
                availableMoves[newX][newY] = true;
              }
            }
            else if(board[newX][newY][2] == 1){
              if(colour.equals("black"))
                continue;
              else{
                fill(red);
                availableMoves[newX][newY] = true;
              }
            }
            rect(newX*80, newY*80, 80, 80);
          }
        }
      }
      else{
        for(int tempY = -2; tempY <= 2; tempY +=4){
          newY = y + tempY;
          
          if(newX >= 0 && newX <= 7 && newY >= 0 && newY <= 7){
            if(board[newX][newY] == null){
              fill(green);
              availableMoves[newX][newY] = true;
            }
            else if(board[newX][newY][2] == 0){
              if(colour.equals("red"))
                continue;
              else{
                fill(red);
                availableMoves[newX][newY] = true;
              }
            }
            else if(board[newX][newY][2] == 1){
              if(colour.equals("black"))
                continue;
              else{
                fill(red);
                availableMoves[newX][newY] = true;
              }
            }
            rect(newX*80, newY*80, 80, 80);
          }
        }
      }
    }
  }
  
  void checkTrade(){
    if((colour.equals("red") && y == 0) || (colour.equals("black") && y == 7)){
      print(y);
      tradeColor = colour;
      tradeCoordinates[0] = initialInfo[0];
      tradeCoordinates[1] = initialInfo[1];
      tradeCoordinates[2] = x;
      tradeCoordinates[3] = y;
      
      PImage rook = loadImage(tradeColor + " rook.jpg");
      rook.resize(50, 50);
      image(rook, 15, 655);
      
      PImage knight = loadImage(tradeColor + " knight.jpg");
      knight.resize(50, 50);
      image(knight, 75, 655);
      
      PImage bishop = loadImage(tradeColor + " bishop.jpg");
      bishop.resize(50, 50);
      image(bishop, 135, 655);
      
      PImage queen = loadImage(tradeColor + " queen.jpg");
      queen.resize(50, 50);
      image(queen, 195, 655);
    }
  }
}
  
  
