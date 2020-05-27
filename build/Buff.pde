float BUFF_SIZE = 50;

class Buff extends Obstacle {
  float r;
  PImage icon;
  BuffType type;

  Buff( float iy, BuffType iType) {
    super(iy);
    r = BUFF_SIZE;
    type = iType;
    icon = getIcon();
  }
  
  PImage getIcon() {
    switch(type) {
    case SHIELD:
      return loadImage("Tokens/Token-01.png");
    case TIME_SLOW:
      return loadImage("Tokens/Token-03.png");
    case CHANGE:
      return loadImage("Tokens/Token-05.png");
    default:
      return loadImage("Tokens/Token-04.png");
    } 
  }

  void display() {  
    imageMode(CENTER);
    image(icon, x, y);
  }
  
  boolean detectCollision() {
    if (p.x+(p.w/2) > x-(r/2) && p.x-(p.w/2) < x+(r/2) && p.y+(p.h/2) > y-(r/2) && p.y-(p.h/2) < y+(r/2)) {
      tokenSound.play();
      tokenSound.rewind();
      return true;
    }
    return false;
  }
  
  void effect() {
    switch(type)
    {
    case SHIELD:
      shield+=200;
      break;
    case TIME_SLOW:
      ROLLING_SPEED*=0.95;
      break;
    case ANTIGRAVITY:
      antigravity+=300;
      break;
    case CHANGE:
      mode=getMode();
      landscape = loadLandscape();
      for (int i = 0; i < 5; i++)
        bigProps[i] = new BigProp(480 * (i+0.5));
      for (int i = 0; i < 5; i++)
        smallProps[i] = new SmallProp(480 * (i+1));
    }
  }
}

public enum BuffType {
  SHIELD, TIME_SLOW, ANTIGRAVITY, CHANGE
}
