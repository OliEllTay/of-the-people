PFont helvetica;
CountryPoint cp;

void setup() {
  size(500, 500);
  cp = new CountryPoint("Country with extra text", 200, 200, 150, 0.3, 0.4, 0.5, 1);
  
  //"HelveticaNeue-Light"
  helvetica = createFont("HelveticaNeue-Light", 32);
  textFont(helvetica);
}

void draw() {
  background(255);

  cp.display();
}


class CountryPoint {
  float xloc, yloc, sz, s1, s2, s3, s4, r;
  color cl1, cl2;
  String nm;

  CountryPoint(String name, float x, float y, float size, float seg1, float seg2, float seg3, float seg4) {
    xloc = x;
    yloc = y;
    sz = size;
    s1 = seg1;
    s2 = seg2;
    s3 = seg3;
    s4 = seg4;
    nm = name;
  }

  void display() {
    
    r = sz;
    cl1 = 50;
    cl2 = 100;
    
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
    stroke(100);
    ellipse(xloc, yloc, r, r);
    
    // 50% guide
    stroke(255);
    ellipse(xloc, yloc, sqrt(0.5) * r, sqrt(0.5) * r);
    
    // name text
    textSize(r / 5);
    textLeading(r / 5);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    text(nm, xloc, yloc - 0.9 * r, 1.25 * r, r);
  }
}
