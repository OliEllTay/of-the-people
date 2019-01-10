
CountryPoint cp;

void setup() {
  size(500, 500);
  cp = new CountryPoint(50, 50, 30, 40, 50, 60);
}

void draw() {
  background(0);

  cp.display();
}


class CountryPoint {
  float xloc, yloc, s1, s2, s3, s4;

  CountryPoint(float x, float y, float seg1, float seg2, float seg3, float seg4) {
    xloc = x;
    yloc = y;
    s1 = seg1;
    s2 = seg2;
    s3 = seg3;
    s4 = seg4;
  }

  void display() {
    arc(xloc, yloc, s1, s1, 0, HALF_PI);
    arc(xloc, yloc, s2, s2, HALF_PI, PI);
    arc(xloc, yloc, s3, s3, PI, PI + HALF_PI);
    arc(xloc, yloc, s4, s4, HALF_PI + PI, TWO_PI);
  }
}
