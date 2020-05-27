class BigProp {
  float x, y = 605;
  PImage icon;

  BigProp(float x_) {
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
    x += moveX;
  }
  
  void display(){
    move(-1);
    imageMode(CENTER);
    image(icon, x, y);
    if (x < -240)
      x = 2160;
  }
  
  void displayStatic(){
    imageMode(CENTER);
    image(icon, x, y);
    if (x < -240)
      x = 2160;
  }
  
  PImage getCity(){
    int choice = int(random(5));
    switch (choice){
      case 0: return loadImage("City/Buildings/Buildings-01.png");
      case 1: return loadImage("City/Buildings/Buildings-02.png");
      case 2: return loadImage("City/Buildings/Buildings-03.png");
      case 3: return loadImage("City/Buildings/Buildings-04.png");
      default: return loadImage("City/Buildings/Buildings-05.png");
    }
  }
  
  PImage getVillage(){
    int choice = int(random(5));
    switch (choice){
      case 0: return loadImage("Village/Buildings/Buildings-01.png");
      case 1: return loadImage("Village/Buildings/Buildings-02.png");
      case 2: return loadImage("Village/Buildings/Buildings-03.png");
      case 3: return loadImage("Village/Buildings/Buildings-04.png");
      default: return loadImage("Village/Buildings/Buildings-05.png");
    }
  }
}
