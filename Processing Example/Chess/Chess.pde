Piece[][] pieces, previousPieces;
int[][][] board, previousBoard;
int selected = 0;
String tradeColor = null;
int[] tradeCoordinates;

void setup(){
  size(650, 720);
  frameRate(30);
  Piece[][] p = {
    {new Piece("rook", "black", 0, 0), new Piece("knight", "black", 1, 0), new Piece("bishop", "black", 2, 0), new Piece("queen", "black", 3, 0), 
     new Piece("king", "black", 4, 0), new Piece("bishop", "black", 5, 0), new Piece("knight", "black", 6, 0), new Piece("rook", "black", 7, 0)},
     
    {new Piece("pawn", "black", 0, 1), new Piece("pawn", "black", 1, 1), new Piece("pawn", "black", 2, 1), new Piece("pawn", "black", 3, 1),
     new Piece("pawn", "black", 4, 1),new Piece("pawn", "black", 5, 1), new Piece("pawn", "black", 6, 1), new Piece("pawn", "black", 7, 1)},
     
    {null, null, null, null, null, null, null, null},
    {null, null, null, null, null, null, null, null},
    {null, null, null, null, null, null, null, null}, 
    {null, null, null, null, null, null, null, null}, 
    
    {new Piece("pawn", "red", 0, 6), new Piece("pawn", "red", 1, 6), new Piece("pawn", "red", 2, 6), new Piece("pawn", "red", 3, 6),
     new Piece("pawn", "red", 4, 6),new Piece("pawn", "red", 5, 6), new Piece("pawn", "red", 6, 6), new Piece("pawn", "red", 7, 6), },
     
     {new Piece("rook", "red", 0, 7), new Piece("knight", "red", 1, 7), new Piece("bishop", "red", 2, 7), new Piece("queen", "red", 3, 7),
      new Piece("king", "red", 4, 7), new Piece("bishop", "red", 5, 7), new Piece("knight", "red", 6, 7), new Piece("rook", "red", 7, 7)}
  };
  pieces = p;
  previousPieces = p;
  board = new int[8][8][2];
  previousBoard = new int[8][8][2];
  tradeCoordinates = new int[4];
  
  for(int i = 0; i < 8; i++){ //makes board null
    for(int j = 0; j <8; j++)
      board[i][j] = null;
  }
}

void draw(){
  background(100);
  showBoard();
  
  for(Piece[] r: pieces){  //Handles all pieces
    for(Piece temp: r){
      
      if(temp != null){
        temp.update();
        temp.show(); 
      }
    }
  }
}

void showBoard(){
  int size = 80, counter = 0;
  
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if(counter % 2 + i%2 == 1)
        fill(100);
      else
        fill(250);
        
      counter++;
      strokeWeight(5);
      rect(i*size, j*size, size, size);
    }
  }
  
  rect(510, 660, 80, 30);
  textSize(20);
  fill(0);
  text("Redo", 525, 680);
}

void mousePressed(){
  if(mouseY > 640 && mouseX < 300){
    
    if(mouseX > 15 && mouseX < 65 && tradeColor != null){
      println("Rook Chosen");
      delay(100);
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].type = "rook";
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].image = loadImage(tradeColor + " rook.jpg");
      tradeColor = null;
    }
    else if(mouseX > 75 && mouseX < 125 && tradeColor != null){
      println("Knight Chosen");
      delay(100);
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].type = "knight";
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].image = loadImage(tradeColor + " knight.jpg");
      tradeColor = null;
    }
    
    else if(mouseX > 135 && mouseX < 185 && tradeColor != null){
      println("Bishop Chosen");
      delay(100);
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].type = "bishop";
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].image = loadImage(tradeColor + " bishop.jpg");
      tradeColor = null;
    }
    
    else if(mouseX > 195 && mouseX < 245 && tradeColor != null){
      println("Queen Chosen");
      delay(100);
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].type = "queen";
      pieces[tradeCoordinates[1]][tradeCoordinates[0]].image = loadImage(tradeColor + " queen.jpg");
      tradeColor = null;
    }
  }
  else if(mouseX > 510 && mouseX < 590 && mouseY > 660 && mouseY < 690){
    println("Redone!");
    pieces = previousPieces;
    board = previousBoard;
  }
}
