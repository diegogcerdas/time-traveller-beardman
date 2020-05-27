void newObstacle(float obstacleKind) {
  if (obstacleKind>98)
    ob.add(new Buff(random(TOP + BUFF_SIZE/2, BOTTOM - BUFF_SIZE/2), BuffType.CHANGE));
  else if (obstacleKind>96)
    ob.add(new Buff(random(TOP + BUFF_SIZE/2, BOTTOM - BUFF_SIZE/2), BuffType.SHIELD));
  else if (obstacleKind>94)
    ob.add(new Buff(random(TOP + BUFF_SIZE/2, BOTTOM - BUFF_SIZE/2), BuffType.ANTIGRAVITY));
  else if (obstacleKind>90)
    ob.add(new Buff(random(TOP + BUFF_SIZE/2, BOTTOM - BUFF_SIZE/2), BuffType.TIME_SLOW));
  else if (obstacleKind>60)
    ob.add(new Coin(random(TOP + COIN_SIZE/2, BOTTOM - COIN_SIZE/2)));
  else if (obstacleKind>45)
    ob.add(new MovinBlock(random(TOP, BOTTOM)));
  else if (obstacleKind>30)
    ob.add(new Block(random(TOP, BOTTOM-200)));
  else if (obstacleKind>15)
    ob.add(new Spike());
  obstNumber+=1;
}

Mode getMode() {
    switch(mode)
    {
    case CITY:
      return Mode.VILLAGE;
    default:
      return Mode.CITY;
    }
  }

void moveObstacles() {
  for (Obstacle obstacle: ob){
    obstacle.move(ROLLING_SPEED);
      if (obstacle.getX() < 20){
        ob.remove(obstacle);
      }
      if (obstacle.detectCollision()){
        obstacle.effect();
        ob.remove(obstacle);
      }
  }
}

void showObstacles() {
  for (Iterator<Obstacle> i = ob.iterator(); i.hasNext(); ) {
    i.next().display();
  }
}
