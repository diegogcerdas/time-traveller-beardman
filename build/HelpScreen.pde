ControlP5 CP7;
boolean showHelp = false;

void helpSetup() {
  showHelp = true;
  CP7 = new ControlP5(this);
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 18);

  CP7.addButton("back1")
    .setLabel("Back")
    .setFont(font)
    .setImage(back)
    .setPosition(79, 65)
    .setSize(291, 91)
    ;
  textSize(70);

  textAlign(CENTER, CENTER);
}

public void back1() {
  showHelp = false;
  CP7.getController("back1").remove();
  startScreenSetup();
} 
