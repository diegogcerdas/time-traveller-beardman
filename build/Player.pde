class Player 
{
  PImage character1, character2;
  float h, w, x, y, speed;

  Player( float ih, float iw, float ix, float iy) {
    h = ih;
    w = iw;
    x = ix;
    y = iy;
    initCharacter();
  }
  
  void initCharacter(){
    switch (chosen){
      case 2:
          character1 = loadImage("Characters/Character-03.png");
          character2 = loadImage("Characters/Character-04.png");
          break;
      case 3:
          character1 = loadImage("Characters/Character-05.png");
          character2 = loadImage("Characters/Character-06.png");
          break;
      case 4:
          character1 = loadImage("Characters/Character-07.png");
          character2 = loadImage("Characters/Character-08.png");
          break;
      default:
          character1 = loadImage("Characters/Character-01.png");
          character2 = loadImage("Characters/Character-02.png");
          break;
    }
  }

  void move (float move) {
    y += move;
    y = constrain(y, TOP + h/2, BOTTOM - h/2);
  }

  float getX() {
    return x;
  }

  void display() {
    pushMatrix();
    translate(x,y);
    fill(0,255,0,60);
    if(shield>0)
      ellipse(0,0,200,200);
    if (antigravity > 0)
      rotate(PI);
    if (keyPressed && key==' ') 
      image(character2, 0, 0);
    else
      image(character1, 0, 0);
    popMatrix();
  }

  void die() {
    print("\nscore: " + score);
    print(", time: ");
    print(time_passed/60);
    y = 1000;
    updateMoney(score);
    gameHasStarted=false;
    score=0;
    counter=0;
    time_passed=0; 
    shield=0;
    antigravity=0;
    gravity_direction=1;
    startScreenSetup();
    ob = new ArrayDeque();
    modeSettings(hardMode);
  }
}
