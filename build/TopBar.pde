ControlP5 CPP;
PImage pause, resume, exit, Icon1, Icon2, Icon3, Gameover1, Gameover2, Continue;

void showTopBar() {
  textFont(createFont("Death Star", 30, true));
  fill(255, 255, 255, 40);
  noStroke();
  rect(0, 0, width*2, TOP+60);
  fill(255);
  text(time_passed/10 + " m", 130, 45);
  fill(255);
  text(score, width - 130, 45);
  image(Icon2, width - 220, 20);

  if (shield>0)
  {      
    String shieldString = nf(shield/60, 1, 1);
    fill(255);
    if (shield/60 < 1)
      fill(255, 30, 30);
    text(shieldString, 365, 45);
    image(Icon1, 260, 20);
  }
  if (antigravity>0)
  {  
    String AGString = nf(antigravity/60, 1, 1);
    fill(255);
    if (antigravity/60 < 1)
      fill(255, 30, 30);
    text(AGString, 515, 45);
    image(Icon3, 410, 20);
  }
  pause();
}

int pauseWait=0;

void pauseSetup(){
  CPP = new ControlP5(this);
      pfont = createFont("Arial", 10, true);
      font = new ControlFont(pfont, 18);

      CPP.addButton("resumeButton")
        .setLabel("Resume")
        .setImage(resume)
        .setFont(font)
        .setPosition(978, 557)
        .setSize(303, 132)
        ;
      textSize(70);

      CPP.addButton("menuButton")
        .setLabel("Menu")
        .setImage(exit)
        .setFont(font)
        .setPosition(640, 557)
        .setSize(303, 132)
        ;
      textSize(70);

      CPP.addButton("fakeButton6")
        .setSize(0, 0)
        .setLabel("");

      gameSound.pause();
}

void pause() {
  fill(0, 0, 50);
  if (keyPressed && (key=='p' || key=='P') && pauseWait==0 && gameHasStarted ) {
    pauseWait+=10;
    if (paused) {
      resumeButton();
    } else {
      paused=true;
      pauseSetup();
    }
  }
  if (pauseWait>0)
    pauseWait--;
  if (paused) {
    displayStaticProps();
    showObstacles();
    p.display();
    image(pause, width/2, height/2);
  }
}

public void resumeButton() {
  paused=false;
  gameSound.loop();
  CPP.getController("menuButton").remove();
  CPP.getController("resumeButton").remove();
}

public void menuButton() {
  paused=false;
  gameover = false;
  menuSound.rewind();
  menuSound.play();
  CPP.getController("menuButton").remove();
  CPP.getController("resumeButton").remove();
  p.die();
} 
