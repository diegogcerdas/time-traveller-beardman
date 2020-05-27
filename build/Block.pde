int SQUARE_SIZE = 50;

class Block extends Obstacle {
  float h, w;
  PImage icon1, icon2;
  boolean flap;

  Block(float iy) {
    super(iy);
    h = SQUARE_SIZE;
    w = SQUARE_SIZE;
    switch(mode){
      case CITY:
        cityIcons();
        break;
      case VILLAGE:
        villageIcons();
        break;
    }
    flap = false;
  }
  
  boolean detectCollision() {
    if (p.x+(p.w/2) > x-(w/2) && p.x-(p.w/2) < x+(w/2) && p.y+(p.h/2) > y-(h/2) && p.y-(p.h/2) < y+(h/2))
      return true;
    return false;
  }
  
  void cityIcons(){
    int choice = int(random(3));
    switch (choice){
      case 0: 
          icon1 = loadImage("City/Birds/Birds-1-1.png");
          icon2 = loadImage("City/Birds/Birds-1-2.png");
          break;
      case 1: 
          icon1 = loadImage("City/Birds/Birds-2-1.png");
          icon2 = loadImage("City/Birds/Birds-2-2.png");
          break;
      default: 
          icon1 = loadImage("City/Birds/Birds-3-1.png");
          icon2 = loadImage("City/Birds/Birds-3-2.png");
          break;
    }
  }
  
  void villageIcons(){
    int choice = int(random(3));
    switch (choice){
      case 0: 
          icon1 = loadImage("City/Birds/Birds-1-1.png");
          icon2 = loadImage("City/Birds/Birds-1-2.png");
          break;
      case 1: 
          icon1 = loadImage("City/Birds/Birds-2-1.png");
          icon2 = loadImage("City/Birds/Birds-2-2.png");
          break;
      default: 
          icon1 = loadImage("City/Birds/Birds-3-1.png");
          icon2 = loadImage("City/Birds/Birds-3-2.png");
          break;
    }
  }
  
  void move (float moveX) {
    x+=moveX-8;
  }

  void display() {
    imageMode(CENTER);
    if (!flap)
      image(icon1, x, y);
    else
      image(icon2, x, y);
    if (frameCount % 10 == 0)
      flap = !flap;
  }
  
  void effect() {
    if (shield>0)
      score+=3;
    else {
      gameover = true;
      gameOverSetup();
    }
  }
}
