//ps I did not do a moving background as I realized the way i drew my background, 
//it would not make sense for backgrounds to scroll

allButton button1, button2, button3; //button class variables

String gameState;
PImage prisonCell, hallway, hallway2, cafeteria, doors, man;

float prisonerX;
float prisonerY;
float prisonerW;
float prisonerH;

float manX;

void setup() {
  size(600, 700);

  //allows me to make new buttons with diff x and y coords using button class
  button1 = new allButton(100, 250);
  button2 = new allButton (200, 200);
  button3 = new allButton (300, 300);

  //gameState ="startScreen";
  gameState ="prisonCell";

  //images (game screens)
  prisonCell = loadImage ("Scene_1.png");
  hallway = loadImage ("Scene_2.png");
  hallway2 = loadImage("Scene2.5.png");
  cafeteria = loadImage("Scene_3.png");
  doors = loadImage("Scene_4.png");
  man = loadImage("man.png");

  prisonerX = 10;
  prisonerY = 10;
  prisonerW = 10;
  prisonerH = 10;

  manX = 300;
}


void draw() {
  println (mouseX +"," + mouseY);

  if (gameState == "prisonCell") { //Scene 1
    prisonCell();
  }
  else if( gameState == "hallway"){ //scene 2 
    hallway();
  }
}

//scene 1 of game
void prisonCell() { //displays images needed in scene, sets paramater for charachter (creates everything that needs to happen in this scene)
  image(prisonCell, 0, 0);  //prison drawing
  image(man, manX, 300);   // character image
  if (manX <= 110) {    // if certain distance to door, button to open door will appear
    button1.one();
    fill(0);//black
    textSize(30);//20
    text("Open", 130, 280);//open text
  } else if (manX >= 300) { //if near 300(where wall is) man will be blocked
    manX = 300;
  }
}

//scene 2 of game
void hallway(){ // displays image, creates paramters/choices. (does everything needed in scene to continue game)
  image(hallway, 0,0);
   image(man, manX+350, 400);   // character image
}
void stickMan() { //draws a stick man
  rectMode(CENTER);
  ellipseMode(CENTER);

  line(prisonerX*29, prisonerY*49, prisonerW*29, prisonerH*55);//leg
  line(prisonerX*31, prisonerY*49, prisonerW*31, prisonerH*55);//leg
  line(prisonerX*29, prisonerY*44, prisonerW*24, prisonerH*44);//arm
  line(prisonerX*31, prisonerY*44, prisonerW*35, prisonerH*44);//arm
  fill(#FA8D26);//orange colour
  rect(prisonerX*30, prisonerY*46, prisonerW*4, prisonerH*7);//body
  fill(#E3C579);//skin colour
  ellipse(prisonerX*30, prisonerY*40, prisonerW*6, prisonerH*6);//head
  fill(0);//black 
  ellipse(prisonerX*29, prisonerY*39, prisonerW, prisonerH);//eyes
  ellipse(prisonerX*31, prisonerY*39, prisonerW, prisonerH);//eyes
  ellipse(prisonerX*30, prisonerY*41.5, prisonerW*2, prisonerH*.8);
}

void keyPressed() {
  if (keyPressed) {//when a certain key is pressed..
    if (keyCode == LEFT) {//left will make man move left
      manX = manX - 3.5;
    } else if (keyCode == RIGHT) {//right will make man move right
      manX = manX + 3.5;
    }
  }
}



void mousePressed() {
  //button1.one
  if (mouseX >100 && mouseX < 240) {
    if (mouseY >250 && mouseY <300) {
      gameState = "hallway"; //second scene game state
    }
  }
}
