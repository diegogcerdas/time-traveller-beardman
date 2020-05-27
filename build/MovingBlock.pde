int MOVIN_SQUARE_SIZE = 80;

class MovinBlock extends Obstacle {
  float r;
  float ceiling;
  float floor;
  int direction = 1;
  PImage icon;

  MovinBlock( float iy) {
    super(iy);
    r = MOVIN_SQUARE_SIZE;
    ceiling = TOP + r;
    floor = BOTTOM - r;
    switch(mode){
      case CITY:
        icon = getCity();
        break;
      case VILLAGE:
        icon = getVillage();
        break;
    }
  }
  
  PImage getCity(){
    int choice = int(random(2));
    switch (choice){
      case 0: return loadImage("City/Moving/Moving-05.png");
      default: return loadImage("City/Moving/Moving-06.png");
    }
  }
  
  PImage getVillage(){
    int choice = int(random(2));
    switch (choice){
      case 0: return loadImage("Village/Moving/Moving-07.png");
      default: return loadImage("Village/Moving/Moving-08.png");
    }
  }

  void move (float moveX) {
    super.x += moveX;
    if (super.y >= floor || super.y <= ceiling)
      direction = direction *- 1;
    super.y -= 2*direction;
  } 
  
   boolean detectCollision() {
    if (p.x+(p.w/2) > x-(r/2) && p.x-(p.w/2) < x+(r/2) && p.y+(p.h/2) > y-(r/2) && p.y-(p.h/2) < y+(r/2))
      return true;
    return false;
  }

  void display() {
    image(icon, super.x, super.y+50);
  }
  
  void effect() {
    if (shield > 0)
      score += 3;
    else {
      gameover = true;
      gameOverSetup();
    }
  }
}
