//IGNORE THIS DRIVER, ONLY LOOK AT THE PLAYER METHOD
//this driver is meant solely for testing purposes, Jose will be making the driver for the game


import java.util.*;
Scanner s = new Scanner(System.in);
int userSize;

Player player1 = new Player(250, 250, 10);

void setup()
{
size(500,500);
}

void draw()
{
background(0);
player1.display();
}

void keyPressed()
{
char k;
k = key;
player1.movement(k);
}
