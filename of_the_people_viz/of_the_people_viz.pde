
CountryPoint cp;

void setup() {
  size(500, 500);
  cp = new CountryPoint(150, 150, 300, 0.3, 0.4, 0.5, 0.6);
}

void draw() {
  background(0);

  cp.display();
}


class CountryPoint {
  float xloc, yloc, sz, s1, s2, s3, s4, r;

  CountryPoint(float x, float y, float size, float seg1, float seg2, float seg3, float seg4) {
    xloc = x;
    yloc = y;
    sz = size;
    s1 = seg1;
    s2 = seg2;
    s3 = seg3;
    s4 = seg4;
  }

  void display() {
    
    r = sz / 2;
    
    arc(xloc, yloc, r * s1, r * s1, 0, HALF_PI);
    arc(xloc, yloc, r * s2, r * s2, HALF_PI, PI);
    arc(xloc, yloc, r * s3, r * s3, PI, PI + HALF_PI);
    arc(xloc, yloc, r * s4, r * s4, HALF_PI + PI, TWO_PI);
  }
}
