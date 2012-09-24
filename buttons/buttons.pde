//Craig Protzel
//ITP - ICM Fall 2012
//This example demonstrates 4 types of buttons

//Declare conditionals for each button
//Set all buttons to false

boolean buttonTopRight = false;
boolean buttonBottomRight = false;
boolean buttonTopLeft = false;
boolean buttonBottomLeft = false;

//The bottom left will incorporate hovering so it needs additional booleans
//boolean buttonBottomLeftClicked = false;
boolean buttonBottomLeftHover = false;

//Declare a fill variable for each button
color fillTopRight;
float fillBottomRight;
float fillTopLeft;
float fillBottomLeft;

//define active state colors
color hoveringTopRight = color(200, 0, 80);
color notHoveringTopRight = color(80, 0, 200);

void setup() {

  size(400, 400);
  smooth();
  background(0);

  //create permanent grid
  stroke(255);
  line (width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}


void draw() {

  //*************CHECK CONDITIONS*************//    
  //check if the mouse is inside the Top Right Square
  if (mouseX > width/2 && mouseY < height/2) {
    buttonTopRight = true;
    println("Inside Top Right");
  }
  else {
    buttonTopRight = false;
  }

  //check if the mouse is inside the Bottom Right square and if the mouse is pressed
  if (mouseX > width/2 && mouseY > height/2 && mousePressed) {
    buttonBottomRight = true;
    println("Clicked Bottom Right");
  }
  else {
    buttonBottomRight = false;
  }

  //check if the mouse is inside the Bottom Left button and if the button has been clicked
  if (buttonBottomLeft) {
    buttonBottomLeftHover = false;
  }
  //check if the mouse is inside the Bottom Left button and if the button has not been clicked
  else if (mouseX < width/2 && mouseY > height/2) {
    buttonBottomLeftHover = true;
    println("Hover Bottom Left");
  }
  //all other scenarios (check if the mouse is outside the Bottom Left button and if the button has not been clicked)
  else {
    buttonBottomLeft = false;
    buttonBottomLeftHover = false;
  }


  //*************SET COLOR VALUES*************//
  //determine the fill values for each buttons
  if (buttonTopRight == true) {
    fillTopRight = hoveringTopRight;
  }
  else {
    fillTopRight = notHoveringTopRight;
  }

  if (buttonBottomRight) {
    fillBottomRight = 255;
  }
  else {
    fillBottomRight = 0;
  }
  
  if (buttonTopLeft) {
    fillTopLeft = 255;
  }
  else {
    fillTopLeft = 0;
  }

  //the Bottom Left button requires an "else if" to check for hover
  if (buttonBottomLeft) {
    fillBottomLeft = 255;
  }
  else if (buttonBottomLeftHover) {
    fillBottomLeft = 125;
  }
  else {
    fillBottomLeft = 0;
  }



  //*************DRAW BUTTONS*************//
  //set the fill value and draw each button
  fill(fillTopLeft);
  rect(0, 0, width/2, height/2);
  fill(fillTopRight);
  rect(width/2, 0, width/2, height/2);
  fill(fillBottomLeft);
  rect(0, height/2, width/2, height/2);
  fill(fillBottomRight);
  rect(width/2, height/2, width/2, height/2);
  
}


//Use the mousePressed() function to toggle the Top Left and Bottom Left Buttons
//This function is called outside the draw loop so the conditionals don't get reset each frame
void mousePressed() {
  if (mouseX < width/2 && mouseY < height/2) {
    buttonTopLeft = !buttonTopLeft;
    println("Toggle Top Left");
  }

  if (mouseX < width/2 && mouseY > height/2) {
    buttonBottomLeft = !buttonBottomLeft;
    println("Toggle Bottom Left");
  }
}
