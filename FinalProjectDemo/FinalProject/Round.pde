public class Round {
  private ArrayList<Human> crowd;
  private Human Player2;
  private int time;
  private int framerate;
  private int difficulty;
  boolean isGameStarted  = false;
  
  Round(int howHard, int framer) {
    framerate = framer;
    Player2 = new Human();
    crowd =  new ArrayList<Human>();
    switch (howHard){
      case 0:
      time = 2000;
      for (int i = 0; i < 75; i++)
        crowd.add(new Human());
      break;
      case 1:
      time = 1200;
      for (int i = 0; i < 150; i++)
        crowd.add(new Human());
      break;
      case 2:
      time = 600;
      for (int i = 0; i < 200; i++)
        crowd.add(new Human());
      break;
    }
  }
  int gameOver(){
    if (time <= 0) {return 2;}
    if (Player2.getClicked()) {return 1;}
    return 0;
  }
  void showSeeker()
  {
    background(0);
    fill(255);
    circle(Player2.getX(), Player2.getY() + Player2.getHeight() /3, Player2.getHeight() + Player2.getWidth());
    Player2.display();
  }
  void display(){
    if (gameOver() == 0)
    {
      for (Human c : crowd) {
        c.move(4);
        c.display();
      }
      time --;
      Player2.display();
      textSize(26);
      fill(0);
      text(time / framerate, 50, 50);
    }
    else if (gameOver() == 1)
    {
      fill(color(255,255,0));
      rect(width/3, height/3, width/3, height/3);
      textSize(26);
      fill(0);
      text("THE SEEKER HAS WON", width/3 + width/30, height/2);
    }
    else if (gameOver() == 2)
    {
      fill(color(255,255,0));
      rect(width/3, height/3, width/3, height/3);
      fill(0);
      textSize(26);
      text("THE HIDER HAS WON", width/3 + width/25, height/2);
    }
  }
  void checkClicks(){
  for (int i = 0 ; i < crowd.size(); i ++)
  {
    crowd.get(i).click();
    if (crowd.get(i).getClicked()) {time -= 10;}
  }
  Player2.click();
  }
    void movePlayer(){
    switch (keyCode) {
    case UP:
    case 'W':
    Player2.move(0);
    break;
    case DOWN:
    case 'S':
    Player2.move(1);
    break;
    case LEFT:
    case 'A':
    Player2.move(2);
    break;
    case RIGHT:
    case 'D':
    Player2.move(3);
    break;
    }
  }
  int getTime(){
    return time;
  }
}
