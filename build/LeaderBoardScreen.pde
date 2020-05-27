ControlP5 CP9;
boolean showLeaders = false;

void leaderBoardSetup() {
  showLeaders = true;
  CP9 = new ControlP5(this);
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 18);

  CP9.addButton("back4")
    .setLabel("Back")
    .setFont(font)
    .setImage(back)
    .setPosition(79, 65)
    .setSize(291, 91)
    ;
  textSize(70);

  textAlign(CENTER, CENTER);
}

public void back4() {
  showLeaders = false;
  CP9.getController("back4").remove();   // removes the button  
  startScreenSetup();
} 

void showLeaders(){
  textAlign(LEFT);
  textFont(createFont("Death Star", 30, true));
  fill(255);
  image(leaderScreen, width/2, height/2);
  for (int i = 0; i < 5; i++){
    text(leaderboard.scoreStrings[i], width/2-300,((i+1)*107)+310);
  }
}
