abstract class Obstacle 
{
  float x, y;

  Obstacle(float iy) {
    x = width;
    y = iy;
  }

  void move (float moveX) {
    x += moveX;
  } 
  
  void move (float moveX, float moveY) {
    x += moveX;
    y += moveY;
  }

  float getX() {
    return x;
  }

  abstract boolean detectCollision();
  abstract void display();
  abstract void effect();
}
