import java.util.*;
import ddf.minim.*;
import controlP5.*;
import java.net.URI;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

static enum Mode {
  CITY, VILLAGE
}

  int VOICE_SENSITIVITY = 600;  // Default value is 600, if your voice is not recognized, you might want to go up to 5000 (or in-between)

void setup() { 
  minim = new Minim(this);
  modeSettings(hardMode);
  BOTTOM = height - 40;
  background = loadImage("Menu/Background.png");
  landscape = loadLandscape();
  coinSound = minim.loadFile("coinSound.wav");
  tokenSound = minim.loadFile("tokenSound.wav");
  gameOverSound = minim.loadFile("gameOverSound.wav");
  gameSound = minim.loadFile("gameSound.mp3");
  menuSound = minim.loadFile("menuMusic.mp3");
  hand = loadImage("Menu/Hand.png");
  voice = loadImage("Menu/Voice.png");
  store = loadImage("Menu/Store.png");
  leader = loadImage("Menu/Leader.png");
  hard = loadImage("Menu/Hard.png");
  easy = loadImage("Menu/Easy.png");
  help = loadImage("Menu/Help.png");
  back = loadImage("Menu/Back.png");
  Continue = loadImage("Menu/Continue.png");
  pause = loadImage("Menu/Elements/Pause.png");
  logo = loadImage("Menu/Elements/Logo.png");
  helpScreen = loadImage("Menu/Elements/Help.png");
  leaderScreen = loadImage("Menu/Elements/Leaderboard.png");
  storeScreen = loadImage("Menu/Elements/Store.png");
  resume = loadImage("Menu/Resume.png");
  exit = loadImage("Menu/Exit.png");
  Icon1 = loadImage("Tokens/Token-01.png");
  Icon2 = loadImage("Tokens/Token-02.png");
  Icon3 = loadImage("Tokens/Token-04.png");
  Gameover1 = loadImage("Menu/Elements/Highscore.png");
  Gameover2 = loadImage("Menu/Elements/Loss.png");
  for(int i=1; i<12; i++){
    S[i] = loadImage("Menu/StoreButtons/Store-"+i+".png");
  }
  readMoney();
  readItems();
  p = new Player(163, 120, 240, 1000);  fullScreen();
  startScreenSetup();
  leaderboard = new Leaderboard();
  rectMode(CENTER);
  
  menuSound.play();
  
  in = minim.getLineIn();
  for (int i = 0; i < 5; i++)
    bigProps[i] = new BigProp(480 * (i+0.5));
  for (int i = 0; i < 5; i++)
    smallProps[i] = new SmallProp(480 * (i+1));
}

void draw() {
  imageMode(CORNER);
  image(background, 0, 0, width, height);
  textSize(26);
  fill(0, 0, 255);
  textFont(createFont("Death Star", 30, true));
  if (gameHasStarted) {
    playGame();
  }
  imageMode(CENTER);
  if(showHelp)
     image(helpScreen, width/2, height/2);
  if(showLogo)
     image(logo, width/2, height/2-170);
  if(showStore){
     image(storeScreen, width/2, height/2);
     image(Icon2, width - 220, 45);
     fill(255, 255, 0);
     text(money, width - 130, 45);
  }
  if(showLeaders)
     showLeaders();
}

void playGame() {
    image(landscape, 0, 0, width, height);
    showTopBar();
    if (!paused) {
      if (gameover) {
        displayStaticProps();
        displayGameOver(withUser);
      } else {
        displayProps();
        counter++;
        time_passed++;
        if (shield>0)
          shield--;
        if (antigravity>0) {
          gravity_direction=-1;
          antigravity--;
        } else
          gravity_direction=1;
        if (counter==OBST_FREQUENCY) {
          counter=0;
          float obstacleKind=random(100);
          newObstacle(obstacleKind);
          ROLLING_SPEED-=ACCELERATION;
          if (OBST_FREQUENCY>20)
            OBST_FREQUENCY-=2;
        }
        if (!ob.isEmpty()) {
          moveObstacles();
          showObstacles();
        }
        if (voiceControl) {
          float voice = abs(in.right.get(1)*VOICE_SENSITIVITY);
          voice = constrain(voice, 0, FALLING_SPEED*3);
          p.move((FALLING_SPEED - voice)*gravity_direction);
        } else {
          if (keyPressed && key==' ') 
              p.move(-FALLING_SPEED*gravity_direction);
          else
            p.move(FALLING_SPEED*gravity_direction);
        }
        p.display();
      }
    }
}

void displayProps() {
  for (BigProp prop : bigProps) {
    prop.display();
  }
  for (SmallProp prop : smallProps) {
    prop.display();
  }
}

void displayStaticProps() {
  for (BigProp prop : bigProps) {
    prop.displayStatic();
  }
  for (SmallProp prop : smallProps) {
    prop.displayStatic();
  }
}

PImage loadLandscape(){
    switch(mode){
      case CITY:
        return loadImage("City/Background.png");
      default:
        return loadImage("Village/Background.png");
    }
  }


void keyPressed() {
  KEYS[keyCode] = true;
}
void keyReleased() {
  KEYS[keyCode] = false;
}
