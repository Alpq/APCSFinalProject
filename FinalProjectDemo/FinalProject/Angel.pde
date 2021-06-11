public class Angel extends Human{
  private boolean clicked;
    Angel()
    {
      super();
    }
    void display() {
    if (!getClicked()) {
      tint(155, 195, 225);
      image(loadImage("5.png"), getX(), getY(), 100, 120);
    }
  }
  boolean isPrayed(Human other){
    if (dist(getX(), getY(),other.getX(), other.getY()) < 30) {clicked = true; return true;};
    return false;
  }
}
