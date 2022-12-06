class allButton { //button class

  int x, y;
  allButton(int x1, int y1) { //allows me to set x and y to anything in other tab
    x =x1;
    y =y1;
  }

  void one() { //function that will allow me to display button e.g (button.one and button2.one)
    fill(203,136,136,90);
    rect(x, y, 140, 50);
  }
}
