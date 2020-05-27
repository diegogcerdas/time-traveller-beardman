class SmallProp 
{
  float x;
  float y = 860;
  PImage icon;

  SmallProp(float x_) {
    x = x_;
    switch(mode){
      case CITY:
        icon = getCity();
        break;
      case VILLAGE:
        icon = getVillage();
        break;
    }
  }

  void move (float moveX) {
    x+=moveX;
  }
  
  void display(){
    move(-1);
    imageMode(CENTER);
    image(icon, x, y);
    if (x < -480)
      x = 2400;
  }
  
  void displayStatic(){
    imageMode(CENTER);
    image(icon, x, y);
    if (x < -480)
      x = 2400;
  }
  
  PImage getCity(){
    int choice = int(random(4));
    switch (choice){
      case 0: return loadImage("City/Street/Street-01.png");
      case 1: return loadImage("City/Street/Street-02.png");
      case 2: return loadImage("City/Street/Street-03.png");
      default: return loadImage("City/Street/Street-04.png");
    }
  }
  
  PImage getVillage(){
    int choice = int(random(4));
    switch (choice){
      case 0: return loadImage("Village/Street/Street-01.png");
      case 1: return loadImage("Village/Street/Street-02.png");
      case 2: return loadImage("Village/Street/Street-01.png");
      default: return loadImage("Village/Street/Street-02.png");
    }
  }
}
