public class Human {
  private int x, y;
  private color c;
  private boolean clicked;
  private int mheight, mwidth;
  {
    c = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255) );
    x = (int) (Math.random() * (width + 1));
    y = (int) (Math.random() * (height + 1));
    clicked = false;
    mheight = 60;
    mwidth = 30;
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
    line(x, y, x, y + mheight - 20);
    circle(x, y, 25);
    line(x, y + mheight - 20, x - 15, y + mheight);
    line(x, y + mheight - 20, x + 15, y + mheight);
    line(x, y + mwidth/2, x - mwidth/2, y + 30);
    line(x, y + mwidth/2, x + mwidth/2, y + 30);
    }
  }
  void click(){
    if((mouseX >= this.x - mwidth/2 && mouseX <= this.x + mwidth/2) && (mouseY >= this.y - 25 && mouseY <= this.y + mheight)){
    clicked = true;
    }
  }
  boolean getClicked(){
  return clicked;
  }
}
