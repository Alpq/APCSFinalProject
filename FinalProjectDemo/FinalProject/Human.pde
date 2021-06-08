public class Human {
  private int x, y;
  private color c;
  private boolean clicked;
  private int mHeight, mWidth;
  {
    c = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255) );
    x = (int) (Math.random() * (width + 1));
    y = (int) (Math.random() * (height + 1));
    clicked = false;
    mHeight = 60;
    mWidth = 30;
  }
  void move(int direction)
  {
    int[] moves = {0, 1, 2, 3};
    int move = moves[(int) (Math.random() * 4)];
    if (direction != 4) {move = direction;}
    
    switch (move) {
    case 0:
    y -= 10;
    break;
    case 1:
    y += 10;
    break;
    case 2:
    x -= 10;
    break;
    case 3:
    x += 10;
    }
  }
  void display(){
    if (!clicked){
    fill(c);
    line(x, y, x, y + mHeight - 20);
    circle(x, y, 25);
    line(x, y + mHeight - 20, x - 15, y + mHeight);
    line(x, y + mHeight - 20, x + 15, y + mHeight);
    line(x, y + mWidth/2, x - mWidth/2, y + 30);
    line(x, y + mWidth/2, x + mWidth/2, y + 30);
    }
  }
  void click(){
    if((mouseX >= this.x - mWidth/2 && mouseX <= this.x + mWidth/2) && (mouseY >= this.y - 25 && mouseY <= this.y + mHeight)){
    clicked = true;
    }
  }
  boolean getClicked(){
  return clicked;
  }
  int getX() {return x;}
  int getY() {return y;}
  int getWidth() {return mWidth;} 
  int getHeight() {return mHeight;}
}
