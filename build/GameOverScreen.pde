ControlP5 CPGO;
boolean withUser;
int currentDistance, currentScore, currentPlace;

void loadGameOver(int distance, int score) {
  currentDistance = distance;
  currentScore = score;
  currentPlace = leaderboard.checkPlace(distance);
  withUser = false;
  if (currentPlace < 5)
    withUser = true;
}

void gameOverSetup(){
  gameSound.pause();
  gameOverSound.play();
  gameOverSound.rewind();
  delay(2000);
  menuSound.rewind();
  menuSound.play();
  
  loadGameOver(time_passed/10, score);
  
  CPGO = new ControlP5(this);
  pfont = createFont("Death Star", 10, true);
  font = new ControlFont(pfont, 18);

  CPGO.addButton("continueButton")
    .setLabel("Continue")
    .setFont(font)
    .setImage(Continue)
    .setPosition(736, 673)
    .setSize(458, 142)
    ;
  textSize(70);
  
  if(withUser){
  CPGO.addTextfield("usernameField")
    .setLabel("")
    .setFont(new ControlFont(pfont, 30))
    .setPosition(width/2 - 300, height/2)
    .setSize(600, 75)
    ;
  textSize(70);
  }
  
  CPGO.addButton("fakeButton1")
    .setSize(0, 0)
    .setLabel("");
}

void displayGameOver(boolean withUser) {
  pushMatrix();
  translate(width/2, height/2);
  if (withUser)
    image(Gameover1, 0, 0);
  else{
    image(Gameover2, 0, 0);
  }
  popMatrix();
}

public void continueButton() {
  gameover = false;
  if (withUser) {
    String username = ((Textfield) CPGO.getController("usernameField")).getText();
    if (username.isEmpty())
      username = "newUser";
    leaderboard.logNew(currentDistance,username, currentPlace);
    leaderboard.updateLeaders();
    CPGO.getController("usernameField").remove();
  }
  CPGO.getController("continueButton").remove();
  p.die();
}
