//ps I did not do a moving background as I realized the way i drew my background, 
//it would not make sense for backgrounds to scroll

allButton button1, button2, button3, button4, button5, button6, button7; //button class variables

PFont font; //allows me to set a font

PImage prisonCell, hallway, hallway2, cafeteria, doors, man, wallBlood, bloodHand, bloodHands; //images 
String gameState;


//pisoner variables
int prisonerX;
int prisonerY;
int prisonerW;
int prisonerH;

//player character x
float manX;

//counter to time text
float counter = 0;

//objects 
boolean money = false;
boolean tranquilizer = false;



void setup() {
  size(600, 700);

  //loads font
  font = loadFont("Chiller-Regular-48.vlw");

  //allows me to make new buttons with diff x and y coords using button class
  button1 = new allButton(100, 250);
  button2 = new allButton (10, 350);
  button3 = new allButton (200, 350);
  button4 = new allButton (310, 380);
  button5 = new allButton (460, 380);
  //gameState ="startScreen";
  gameState ="prisonCell";

  //images (game screens + man)
  prisonCell = loadImage ("Scene_1.png");
  hallway = loadImage ("Scene_2.png");
  hallway2 = loadImage("Scene2.5.png");
  cafeteria = loadImage("Scene_3.png");
  doors = loadImage("Scene_4.png");
  man = loadImage("man.png");
  wallBlood = loadImage("blood_drip.png");
  bloodHand = loadImage("blood_hand.png");
  bloodHands = loadImage("blood_hands.png");


  //setting values for prisoner coords
  prisonerX = 14;
  prisonerY = 12;
  prisonerW = 14;
  prisonerH = 12;

  //player starting x coord
  manX = 300;
}


void draw() {
  println (mouseX +"," + mouseY);

  textFont(font, 40);
  
  if (gameState == "prisonCell") { //scene 1
    prisonCell();
  } else if (gameState == "hallway") { //scene 2 
    hallway();
  } else if (gameState =="cafeteria") {// scene 3
    cafeteria();
  } else if (gameState == "noItem") { //concequence of choosing item that you don't have in scene 3
    noItem();
  } else if (gameState =="tranq") {  //when player picks tranquilizer in hallways and picks "tranq him" in scene 3
  }
}

//scene 1 of game - PRISONCELL
void prisonCell() { //displays images needed in scene, sets paramater for charachter (creates everything that needs to happen in this scene)

  image(prisonCell, 0, 0);  //prison drawing
  image(man, manX, 300);   // character image
  if (manX <= 110) {    // if certain distance to door, button to open door will appear
    button1.one(); //makes button
    fill(0);//black
    textSize(50);
    text("Open", 130, 280);//text on button
  } else if (manX >= 300) { //if near 300(where wall is) man will be blocked
    manX = 300;
  }
}

//scene 2 of game - HALLWAY
void hallway() { // displays image, creates paramters/choices. (does everything needed in scene to continue game)
  image(hallway, 0, 0);
  image(man, manX, 400); // displays character image 

  if (manX <= 215) { //displays item choices above chest when player is close
    //displays button and text
    button2.one();
    fill(0);
    text("money", 40, 375);
    button3.one();
    fill(0);
    text("tranquilizer", 202, 375);
  } else if (manX >= 515) {//character unable to go left of door
    manX = 515;
  } else if (manX <= 490) { //displays text about chest as player gets closer
    fill(137, 0, 0);
    textSize(60);
    text("you have found a lucky chest", 100, 250);
    if (manX <= 390) {
      textSize(50);
      text("open it, and choose wisely", 2, 320);
    }
  }
}
//scene 3 of game - CAFETERIA
void cafeteria() { //displays image, creates paramters/choices. (does everything needed in scene to continue game)
  counter = counter +1; //starts counter
  image(cafeteria, 0, 0);
  image(man, manX, 420);
  evilMan();

  if (counter < 150) { //text  displays untill certain time
    textSize(30);
    fill(255);
    text("Hey PUNK this is my turf", 300, 390); 
    text("either you get lost", 300, 415); 
    text("or i will beat you up", 300, 440);
  } else if (counter < 350) { //certian time passes, new text appears
    textSize(20);
    fill(#FF1C1C);
    text(" oh no, I must go through", 80, 420);
  } else if (counter < 550) {//certian time passes, new text appears
    textSize(20);
    fill(#FF1C1C);
    text("maybe I should use the item from the chest", 90, 400);
    text("lets approach him slowly", 90, 430);
  }
  if (manX >= 270) { //when close to prisoner, choices appear
    button4.one();
    fill(0);
    text("tranq him", 320, 410);
    button5.one();
    fill(0);
    text("bribe him", 485, 410);
  } else if (manX <=3) { //does not let player move out of screen towards left
    manX = 3;
  }
}

void noItem() {// scene occurs when player approaches prisoner and picks the item they do not have

  counter = counter +1;//increases counter
  background(0);// background turn black
  restartButton();
  for ( int i = -105; i <= 600; i += 300) { //displays blood on top of screen
    image(wallBlood, i, -60);
  }

  if (counter < 250) {//text displays for certain time
    fill(255);
    textSize(60);
    text("Uh Oh", 250, 270);
    textSize(40);
    text("you tried using an item you dont have on the prisoner", 10, 330);
  } else if (counter < 550) {
    fill(255);
    textSize(40);
    text("he became angry and beat you up", 120, 350);
    text("injuries were fatal", 210, 430);
  } else if ( counter < 1050) {
    fill(255, counter/3, counter/3);
    textSize(80);
    text("YOU HAVE DIED", 100, 300);
    image(bloodHands, 300, 300);
  }
}

void tranq (){ //TEMPORARY SCREEN MAKE PROPPER SOON
    counter = counter +1;//increases counter
  background(0);// background turn black
  restartButton();
  for ( int i = -105; i <= 600; i += 300) { //displays blood on top of screen
    image(wallBlood, i, -60);
  }

  if (counter < 250) {//text displays for certain time
    fill(255);
    textSize(60);
    text("Uh Oh", 250, 270);
    textSize(40);
    text("you tried using an item you dont have on the prisoner", 10, 330);
  } else if (counter < 550) {
    fill(255);
    textSize(40);
    text("he became angry and beat you up", 120, 350);
    text("injuries were fatal", 210, 430);
  } else if ( counter < 1050) {
    fill(255, counter/3, counter/3);
    textSize(80);
    text("YOU HAVE DIED", 100, 300);
    image(bloodHands, 300, 300);
  }
}
  
  
}
void evilMan() { //draws a stick man
  rectMode(CENTER);
  ellipseMode(CENTER);

  line(prisonerX*29, prisonerY*49, prisonerW*29, prisonerH*55);//leg
  line(prisonerX*31, prisonerY*49, prisonerW*31, prisonerH*55);//leg
  line(prisonerX*29, prisonerY*44, prisonerW*24, prisonerH*47);//arm
  line(prisonerX*31, prisonerY*44, prisonerW*35, prisonerH*47);//arm
  fill(#FA8D26);//orange colour
  rect(prisonerX*30, prisonerY*46, prisonerW*4, prisonerH*7);//body
  fill(#E3C579);//skin colour
  ellipse(prisonerX*30, prisonerY*40, prisonerW*6, prisonerH*6);//head
  fill(0);//black 
  ellipse(prisonerX*29, prisonerY*39, prisonerW, prisonerH);//eyes
  ellipse(prisonerX*31, prisonerY*39, prisonerW, prisonerH);//eyes
  ellipse(prisonerX*30, prisonerY*41.5, prisonerW*2, prisonerH*.8);
}

void restartButton() { // creates restart button 
  rectMode((CORNER));
  fill(160, 11, 11, 70);
  rect(55, 550, 490, 100);
  fill(255);
  textSize(80);
  text("Restart", 200, 620);
}


void keyPressed() { //allows player to move
  if (keyPressed) {//when a certain key is pressed..
    if (keyCode == LEFT) {//left will make man move left
      manX = manX - 3.5;
    } else if (keyCode == RIGHT) {//right will make man move right
      manX = manX + 3.5;
    }
  }
}



void mousePressed() {
  //button1.one (open door)
  if (gameState == "prisonCell") {
    if (mouseX >100 && mouseX < 230) {
      if (mouseY >250 && mouseY <290) {
        gameState = "hallway"; //second scene game state
        manX = 535;
      }
    }
  }
  //button2.one (money option)
  if (gameState == "hallway") {
    if (mouseX > 10 && mouseX < 140) {
      if (mouseY > 350 && mouseY < 390) {
        money = true;
        gameState = "cafeteria";
        manX = 10;
      }
    }
    //button3.one (tranquilizer option)
    if (mouseX > 200 && mouseX < 330) {
      if (mouseY > 350 && mouseY < 390) {
        tranquilizer = true;
        gameState ="cafeteria";
        manX = 10;
      }
    }
  }
  //button4.one and button5.one (tranq him option)
  if (gameState == "cafeteria") { 
    if (tranquilizer == true && money == false) { //if tranq was selected in cafeteria scene and in hallway scene
      if (mouseX > 310 && mouseX < 440) {
        if (mouseY > 380 && mouseY <420) {
          gameState = "tranq";
        }
      }
      if (mouseX > 460 && mouseX < 590) {
        if (mouseY > 380 && mouseY < 420) {
          gameState = "noItem";
          counter = 0;
        }
      }
    }

    //button4/one and button5.one (bribe him option)
    else  if (tranquilizer == false && money == true) { //if tranq was not picked in hallways scene and pressed during cafeteria scene
      if (mouseX > 310 && mouseX < 440) {
        if (mouseY > 380 && mouseY <420) {
          gameState = "noItem";
          counter = 0;
        }
      }
      if (mouseX > 460 && mouseX < 590) {
        if (mouseY > 380 && mouseY < 420) {

          background(#1ADEFF);
        }
      }
    }
  }
  if (gameState == "noItem") { // for restart button
    if (mouseX > 55 && mouseX < 545) {
      if (mouseY > 550 && mouseY < 650) {
        //gameState = "startScreen"; change this to when start screen is made
        gameState = "prisonCell";
        manX = 300;
        counter = 0;
      }
    }
  }
}
