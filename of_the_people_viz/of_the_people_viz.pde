
CountryPoint cp;

void setup() {
  size(500, 500);
  cp = new CountryPoint(150, 150, 300, 0.3, 0.4, 0.5, 1);
}

void draw() {
  background(255);

  cp.display();
}


class CountryPoint {
  float xloc, yloc, sz, s1, s2, s3, s4, r;
  color cl1, cl2;

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
    
    r = sz;
    cl1 = 50;
    cl2 = 25;
    
    // circle segments
    noStroke();
    fill(cl1);
    arc(xloc, yloc, r * sqrt(s1), r * sqrt(s1), 0, HALF_PI);
    arc(xloc, yloc, r * sqrt(s3), r * sqrt(s3), PI, PI + HALF_PI);
    fill(cl2);
    arc(xloc, yloc, r * sqrt(s2), r * sqrt(s2), HALF_PI, PI);
    arc(xloc, yloc, r * sqrt(s4), r * sqrt(s4), HALF_PI + PI, TWO_PI);
    
    // 100% guide
    ellipseMode(CENTER);
    noFill();
    stroke(50);
    ellipse(xloc, yloc, r, r);
  }
}
