Round Game;
int framerate;

void setup() {
  framerate = 20;
  frameRate(framerate);
  size(1000, 800);
  Game = new Round(1, framerate);
}

void draw() {
  background(250);
  Game.display();
}

void mousePressed() {
  Game.checkClicks();
}

void keyPressed() {
  Game.movePlayer();
}


/*
  noLoop();
  background(255);
  Player2.display();
  loop();
  text(String.valueOf(time), 10, 10);
  background(200);
  frameRate(10);
  Player2.display();
    for (Human c : crowd) {
    c.move(4);
    c.display();
  }
  time --;


*/
