public class Angel extends Human{
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
    return dist(getX(), getY(),other.getX(), other.getY()) < 30;
  }
}
