public class button {
  String text;
  boolean clicked;
  int x, y, w, l;
  color c;
  button(String option, int xx, int yy, int ww, int ll, color cc) {
    text = option;
    x = xx;
    y = yy;
    w = ww;
    l = ll;
    c = cc;
    clicked = false;
  }
  void display() {
    fill(3 * red(c) / 4,3 * green(c) / 4,3 * blue(c) / 4);
    rect(x - w / 12,y + l / 12 , w, l);
    fill(c);
    rect(x, y, w, l);
    textSize(26);
    fill(0);
    text(text, x + (w / 5), y + (l / 2));
  }
  void click() {
    if ((mouseX >= x && mouseX <= x + w) && (mouseY >= y && mouseY <= y + w)) {
      clicked = true;
    }
  }
  boolean isClicked() {
    return clicked;
  }
}
