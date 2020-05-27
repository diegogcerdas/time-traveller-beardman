ControlP5 CP5;
ControlFont font;
PFont pfont;
boolean hardMode=false;
boolean showLogo = true;

PImage hand, voice, store, leader, easy, hard, help, back, helpScreen, leaderScreen, storeScreen, logo;

void startScreenSetup() {
  showLogo = true;
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 18);
  CP5= new ControlP5(this);
  CP5.addButton("voiceButton")
    .setLabel("")
    .setFont(font)
    .setImage(voice)
    .setPosition(width/2+12, height/2+2)
    .setSize(303, 132)
    ;
  textSize(70);

  CP5.addButton("keyboardButton")
    .setLabel("")
    .setFont(font)
    .setImage(hand)
    .setPosition(width/2-325, height/2+2)
    .setSize(303, 132)
    ;
  textSize(70);

  CP5.addButton("storeButton")
    .setLabel("")
    .setFont(font)
    .setImage(store)
    .setPosition(width/2-170, height/2+165)
    .setSize(147, 132)
    ;
  textSize(70);   

  CP5.addButton("helpButton")
    .setLabel("")
    .setFont(font)
    .setImage(help)
    .setPosition(width-165, 65)
    .setSize(86, 86)
    ;
  textSize(70);

  CP5.addButton("switchButton")
    .setLabel("")
    .setFont(font)
    .setImage(hardMode? hard: easy)
    .setPosition(width-440, 65)
    .setSize(239, 88)
    ;
  textSize(70);
  
  if (hardMode)
     CP5.getController("switchButton").setColorBackground(color(255, 0, 0));
  else
     CP5.getController("switchButton").setColorBackground(color(0, 45, 89));
  
  CP5.addButton("leaderBoardButton")
    .setLabel("")
    .setFont(font)
    .setImage(leader)
    .setPosition(width/2+12, height/2+165)
    .setSize(147, 132)
    ;
  textSize(70);

  CP5.addButton("fakeButton")
    .setSize(0, 0)
    .setLabel("");

  CP5.addButton("fakeButton2")
    .setSize(0, 0)
    .setLabel("");

  CP5.addButton("fakeButton3")
    .setSize(0, 0)
    .setLabel("");

  CP5.addButton("fakeButton4")
    .setSize(0, 0)
    .setLabel("");

  CP5.addButton("fakeButton5")
    .setSize(0, 0)
    .setLabel("");
  CP5.addButton("fakeButton6")
    .setSize(0, 0)
    .setLabel("");
  CP5.addButton("fakeButton7")
    .setSize(0, 0)
    .setLabel("");


  textAlign(CENTER, CENTER);
}

public void switchButton() {
  hardMode=!hardMode;
  modeSettings(hardMode);
  if (hardMode)
     CP5.getController("switchButton").setImage(hard);
  else
     CP5.getController("switchButton").setImage(easy);
}

public void modeSettings(boolean hardMode){
  if(hardMode){
    ROLLING_SPEED = -18;
    OBST_FREQUENCY = 40;
    ACCELERATION = 0.15;
  }
  else{
    ROLLING_SPEED = -12;
    OBST_FREQUENCY = 70;
    ACCELERATION = 0.05;
  }
  
}

public void keyboardButton() {
  showLogo = false;
  menuSound.pause();
  gameSound.rewind();
  gameSound.loop();
  gameHasStarted = true;
  voiceControl=false;

  CP5.getController("keyboardButton").remove();   // removes the button
  CP5.getController("voiceButton").remove();
  CP5.getController("storeButton").remove();// removes the button
  CP5.getController("helpButton").remove();
  CP5.getController("switchButton").remove();
  CP5.getController("leaderBoardButton").remove();
} 

public void voiceButton() {
  showLogo = false;
  menuSound.close();
  gameSound.rewind();
  gameSound.loop();
  gameHasStarted = true;
  voiceControl=true;
  CP5.getController("voiceButton").remove();   // removes the button
  CP5.getController("keyboardButton").remove();   // removes the button
  CP5.getController("storeButton").remove();// removes the button
  CP5.getController("helpButton").remove();
  CP5.getController("switchButton").remove();
  CP5.getController("leaderBoardButton").remove();
} 

public void storeButton() {
  showLogo = false;
  storeSetup();
  CP5.getController("voiceButton").remove();   // removes the button
  CP5.getController("storeButton").remove();// removes the button
  CP5.getController("keyboardButton").remove();   // removes the button
  CP5.getController("helpButton").remove();
  CP5.getController("switchButton").remove();
  CP5.getController("leaderBoardButton").remove();
} 

public void helpButton() {
  showLogo = false;
  helpSetup();
  CP5.getController("voiceButton").remove();   // removes the button
  CP5.getController("storeButton").remove();// removes the button
  CP5.getController("keyboardButton").remove();   // removes the button
  CP5.getController("helpButton").remove();
  CP5.getController("switchButton").remove();
  CP5.getController("leaderBoardButton").remove();
} 

public void leaderBoardButton() {
  showLogo = false;
  leaderBoardSetup();
  CP5.getController("voiceButton").remove();   // removes the button
  CP5.getController("storeButton").remove();// removes the button
  CP5.getController("keyboardButton").remove();   // removes the button
  CP5.getController("helpButton").remove();
  CP5.getController("switchButton").remove();
  CP5.getController("leaderBoardButton").remove();
} 
