Round game;

void setup() {
  int framerate = 60;
  frameRate(framerate);
  size(1000, 800);
  game = new Round(framerate);
}

void draw() {
  background(245,222,179);
  int phase = game.getPhase();
  switch (phase) {
    case -1:
    game = new Round(20); 
    break;
    case 0:
      game.displayDifficultySelection();
      break;
    case 1:
      game.showSeeker();
      break;
    case 2:
      game.display();
      break;
    case 3:
      game.endDisplay();
      
  }
}

void keyPressed() {
  if (game.getPhase() == 1) {
    game.showSeekerPress();
  }
  else if (game.getPhase() == 2) {
    game.movePlayer();
    game.spawn();
  }
}
void mousePressed() {
  if (game.getPhase() == 0) {
      game.difficultyButtonsClick();
    }
  else if (game.getPhase() == 2) {
      game.checkClicks();
    }
  else if (game.getPhase() == 3) {
      game.playAgainClick();
    }
}
