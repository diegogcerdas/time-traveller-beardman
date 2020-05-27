boolean gameHasStarted = false;
boolean voiceControl;

Minim minim;
AudioInput in;
AudioPlayer coinSound;
AudioPlayer tokenSound;
AudioPlayer gameOverSound;
AudioPlayer gameSound;
AudioPlayer menuSound;

final static float OBSTACLE_SIZE = 80;
final static float FALLING_SPEED = 15;
float BOTTOM;
final float TOP = 120;
float ROLLING_SPEED;
float OBST_FREQUENCY = 70;
float ACCELERATION = 0.05;
final boolean[] KEYS = new boolean[255];

boolean paused=false;
boolean gameover=false;
int money=0;
int score=0;
int counter=0;
int time_passed=0; 
float shield=0;
float antigravity=0;
int gravity_direction=1;

Queue<Obstacle> ob = new ArrayDeque(); 
ArrayList<Button> buttonsDisplayed = new ArrayList<Button>();
Player p;
int obstNumber=0;
PImage background, landscape;
BigProp[] bigProps = new BigProp[5];
SmallProp[] smallProps = new SmallProp[5];
Mode mode = Mode.CITY;
Leaderboard leaderboard;
