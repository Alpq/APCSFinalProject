public class Human {
  private int x, y;
  private color c;
  private boolean clicked;
  private int mHeight, mWidth;
  private int pastMove;
  PImage photo = loadImage((int)(Math.random() * 4) + ".png");

  Human() {
    mHeight = 80;
    mWidth =  30;
    c = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255)); 
    x = (int)(Math.random() * (width - mWidth)) + 100;
    y = (int)(Math.random() * (height - mHeight)) + 100 + mHeight;
    clicked = false;
    while (wrong()) {
      this.x = new Human().getX();
      this.y = new Human().getY();
    }
  }
  void move(int direction) {
    int dy = 0;
    int dx = 0;
    int moves[] = {0, 1, 2, 3, 4};
    int move = moves[(int)(Math.random()* 4)];
    if (Math.random() < .5) {move = pastMove;}
    if (direction != 5) {move = direction;}
    pastMove = move;
      switch (move) {
      case 0:
        dy = -5;
        break;
      case 1:
        dy = 5;
        break;
      case 2:
        dx = -5;
        break;
      case 3:
        dx = 5;
        break;
    }
    x += dx;
    y += dy;
    if (wrong()) {
      x -= dx;
      y -= dy;
    }
  }
  boolean wrong() {
    return  x < 50 || x >= width - 50 || y < 50 || y >= height - 50 ||
            x + mWidth >= width - 50 || y + mHeight >= height - 50;
  }
  void display() {
    if (!clicked) {
      tint(c);
      image(photo, x, y, mWidth, mHeight);
    }
  }
  
  void click() {
    if ((mouseX >= this.x && mouseX <= this.x + mWidth) && (mouseY >= this.y && mouseY <= this.y + mHeight)) {
      clicked = true;
    }
  }
  void setColor(color cc){
    c = cc;
  }
  boolean getClicked() {
    return clicked;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getWidth() {
    return mWidth;
  }
  int getHeight() {
    return mHeight;
  }
}
