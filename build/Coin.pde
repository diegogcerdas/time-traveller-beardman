float COIN_SIZE=50;

class Coin extends Obstacle
{
  float r;
  PImage icon;

  Coin( float iy) {
    super(iy);
    icon = loadImage("Tokens/Token-02.png");
    r = COIN_SIZE;
  }

  void display() { 
    imageMode(CENTER);
    image(icon, x, y);
  }
  
 boolean detectCollision() {
    if (p.x+(p.w/2) > x-(r/2) && p.x-(p.w/2) < x+(r/2) && p.y+(p.h/2) > y-(r/2) && p.y-(p.h/2) < y+(r/2)) {
      coinSound.rewind();
      return true;
    }
    return false;
  }
  
  void effect() {
    coinSound.play();
    score+=1;
  }
}
