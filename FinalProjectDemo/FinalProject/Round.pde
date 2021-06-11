public class Round {
  private ArrayList < Human > crowd;
  private ArrayList < Angel > angels;
  private ArrayList < Human > nukes;
  private Human Player2;
  private int time;
  private int framerate;
  private int difficulty;
  private int score;
  private int phase;
  button Easy;
  button Medium;
  button Hard;
  button playAgain;

  Round(int framer) {
    framerate = framer;
    crowd = new ArrayList < Human > ();
    Easy = new button(" Easy", width / 7, 2 * height / 5, width / 7, height / 5, color(50, 200, 50));
    Medium = new button("Medium", 3 * width / 7, 2 * height / 5, width / 7, height / 5, color(255, 255, 0));
    Hard = new button(" Hard", 5 * width / 7, 2 * height / 5, width / 7, height / 5, color(200, 50, 50));
    playAgain = new button("Play\nAgain?", width * 5 / 7, 4 * height / 5, width / 7, height / 5, color(50, 200, 50));
    phase = 0;
  }


  void displayDifficultySelection() {
    fill((2 * second()) % 255, (2.8 * second()) % 255, (2.5 * second()) % 255);
    textSize(50);
    text("FIND YOUR ROBOT FRIEND \n HIDDEN IN PLAIN SIGHT!!", width / 6, height / 6);
    Easy.display();
    Medium.display();
    Hard.display();
  }


  void difficultyButtonsClick() {
    Easy.click();
    Medium.click();
    Hard.click();
    if (Easy.isClicked()) {
      difficulty = 0;
    }
    else if (Medium.isClicked()) {
      difficulty = 1;
    }
    else if (Hard.isClicked()) {
      difficulty = 2;
    }
    generateCrowd(difficulty);
    phase = 1;
  }


  void generateCrowd(int howHard) {
    if (difficulty > 0)
    {
     nukes = new ArrayList < Human > ();
    angels = new ArrayList < Angel > ();
    for (int i = 0; i < 4; i++) {
      nukes.add(new Human());
      nukes.get(i).photo = loadImage("6.png");
    }
    for (int i = 0; i < 20; i++) {
      angels.add(new Angel());
    }
    }
    Player2 = new Human();
    Player2.photo = loadImage("4.png");
    switch (howHard) {
      case 0:
        time = 2000;
        for (int i = 0; i < 100; i++)
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


  void showSeeker() {
    background(0);
    fill(255);
    circle(Player2.getX() + Player2.getWidth() / 2, Player2.getY() + Player2.getHeight() / 2, Player2.getHeight());
    Player2.display();
  }



  void showSeekerPress() {
    phase = 2;
  }


  void movePlayer() {
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

  void drawWalls() {
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        if (((((j < 40) || (j >= width - 40)) || ((i < 40) || (i >= height - 40))))) {
          set(j, i, color((50 * j) % 250));
        }
      }
    }
  }
  int gameOver() {
    if (time <= 0) {
      phase = 3;
      return 2;
    }
    if (Player2.getClicked()) {
      phase = 3;
      return 1;
    }
    return 0;
  }
  void nuke() {
    for (int i = 0; i < nukes.size(); i++) {
      nukes.get(i).click();
      if (nukes.get(i).getClicked()) {
        {
          for (int j = 0; j < crowd.size() / 10; j++) {
            crowd.remove(0);
          }
          nukes.remove(0);
        }
      }
    }
  }
  void spawn() {
    if (difficulty > 0 && angels.size() >= 3){
      for (int i = 0 ; i < 4; i ++)
        if (angels.get(i).isPrayed(Player2)) {
        for (int i = 0; i < 4; i++) {
        angels.remove(0);
        for (int j = 0; j < crowd.size() / 5; j++) {
          crowd.add(new Human());
        }
      }
    }
  }
    
  }
  void eliminate() {
    for (int i = 0; i < crowd.size(); i++) {
      crowd.get(i).click();
      if (crowd.get(i).getClicked()) {
        time -= 100;
        crowd.remove(i);
      }
    }
  }


  void checkClicks() {
    eliminate();
    Player2.click();
    if (difficulty > 0) {
    nuke();
    }
  }

  void displayText() {
    textSize(26);
    fill(0);
    text(time / framerate, 75, 75);
    if (difficulty > 0) {text(angels.size() + " ANGELS REMAINING", 75, 110);}
        if (difficulty > 0) {text(crowd.size() + " PEOPLE REMAINING", 75, 150);}

  }

  void displayPeople() {
    Player2.display();
    for (Human c: crowd) {
      c.move(5);
      c.display();
    }
  }

  void displayAngels() {
    if (angels.size() >= 4)
      for (int i = 0; i < 4; i++) {
        angels.get(i).display();
      }
  }
  void displayNukes() {
    if (nukes.size() > 0)  {nukes.get(0).display();}
  }
  void display() {
    if (gameOver() == 0) {
      drawWalls();
      displayText();
      if (time % 501 < 100 && difficulty > 0) {
        displayNukes();
      }
      if (time % 501 < 400 && difficulty > 0) {
        displayAngels();
      }
      displayPeople();
      time--;
    } else {
      phase = 3;
    }
  }
  void endDisplay() {
    if (gameOver() == 1) {
      displayFinalScreen();
      text("THE SEEKER HAS WON \n SCORE : " + score, width / 3 + width / 30, height / 2);
    } else if (gameOver() == 2) {
      displayFinalScreen();
      text("THE HIDER HAS WON \n SCORE : " + score, width / 3 + width / 25, height / 2);
    }
    playAgain.display();
  }
  void playAgainClick(){
    playAgain.click();
    if (playAgain.isClicked()) {phase = -1;}
  }
  void displayFinalScreen() {
    calculateScore();
    fill(color(255, 255, 0));
    rect(width / 3, height / 3, width / 3, height / 3);
    fill(0);
    textSize(26);
  }
  void calculateScore() {
    if (gameOver() == 1) {
      score = Math.abs(time) * (difficulty + 1);
    }
    if (gameOver() == 2) {
      score = Math.abs(time) * (3 - difficulty + 1);
    }
  }
  int getPhase() {
    return phase;
  }
}
