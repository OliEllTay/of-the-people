import processing.pdf.*;          // Import PDF code

PFont helvetica, didot;
CountryPoint[] cp_store;
Table viz_data;
float x, y, rotation, margin_x, margin_y, rep_women, rep_u40, rep_lgbt, rep_min;
int n_countries;
String country_name, region;
color[] rg_cols;
color col_light, col_dark;

void setup() {
  size(2000, 1000, PDF, "exp_of_the_people.pdf");
  
  // margin_x = 100;
  margin_y = 100;
  
  rg_cols = new color[2];
  
  viz_data = loadTable("viz_data.csv", "header");
  
  n_countries = viz_data.getRowCount();
  cp_store = new CountryPoint[n_countries];
  for (int i = 0; i<n_countries; i++) {
    TableRow row = viz_data.getRow(i);
    x = row.getFloat("x") + margin_x;
    y = row.getFloat("y") + margin_y;
    rotation = row.getFloat("rotation");
    country_name = row.getString("country");
    region = row.getString("region");
    rep_women = row.getFloat("rep_women");
    //rep_lgbt = row.getFloat("rep_lgbt");
    rep_u40 = row.getFloat("rep_u40");
    //rep_min = row.getFloat("rep_min");
    
    rg_cols = region_color(region);
    col_dark = rg_cols[0];
    col_light = rg_cols[1];
    
    cp_store[i] = new CountryPoint(country_name, x, y, rotation, 40, rep_women, rep_u40, col_dark, col_light);
  }
  
  //"HelveticaNeue-Light"
  helvetica = createFont("HelveticaNeue-Light", 32);
  textFont(helvetica);
  
  background(255);

  for (int i = 0; i<n_countries; i++) {
    cp_store[i].display();
  }
  
  // title text
  //"HelveticaNeue-Light"
  didot = createFont("Didot-Italic", 32);
  textFont(didot);
  textSize(44);
  textLeading(44);
  fill(#536271);
  rectMode(CENTER);
  textAlign(LEFT, CENTER);
  text("Of the people, By the people, For the people.", 1050, 650, 300, 300);
  
  // info text
  
  String info = "Governments should represent and reflect the people they govern. Despite recent improvements, women are still underrepresented in world parliaments. Across these countries, there are nearly 7,000 women MPs missing.";
  textSize(30);
  textLeading(30);
  textAlign(CENTER, CENTER);
  text(info, 1000, 820, 810, 400);
  
  exit();
  
}

void draw() {

  
}

color[] region_color(String country_region)
{
  color[] rcs;
  color color_light, color_dark;
  rcs = new color[2];
  
  color_dark = #FFA630;
  color_light = #FACC6B;
  
  if(country_region.equals("Europe")){
    color_dark = #003399;
    color_light = #1F487E;
  }
  
  if(country_region.equals("America")){
    color_dark = #BF0A30;
    color_light = #E3170A;
  }
  
  if(country_region.equals("Oceania")){
    color_dark = #2A6041;
    color_light = #28965A;
  }
  
  if(country_region.equals("Asia")){
    // color_dark = #392B58;
    color_dark = #832161;
    color_light = #645E9D;
  }
  
  if(country_region.equals("Middle East")){
    // color_dark = #536271;
    color_dark = #291F1E;
    color_light = #ADA296;
  }
  
  if(country_region.equals("Africa")){
    // color_dark = #FFB20F;
    color_dark = #D17B0F;
    color_light = #FACC6B;
  }
  
  rcs[0] = color_dark;
  rcs[1] = color_light;
  
  return(rcs);
}


class CountryPoint {
  float xloc, yloc, rot, sz, s1, s2, r;
  String nm, rg;
  color c1, c2, guide_col;

  CountryPoint(String name, float x, float y, float rotation, float size, float seg1, float seg2, color col1, color col2) {
    xloc = x;
    yloc = y;
    rot = rotation;
    sz = size;
    s1 = seg1;
    s2 = seg2;
    //s3 = seg3;
    //s4 = seg4;
    nm = name;
    c1 = col1;
    c2 = col2;
    
  }

  void display() {
    
    r = sz;
    
    // circle segments
    noStroke();
    /*
    fill(c2);
    arc(xloc, yloc, r * sqrt(s1), r * sqrt(s1), 0, HALF_PI);
    arc(xloc, yloc, r * sqrt(s3), r * sqrt(s3), PI, PI + HALF_PI);
    fill(c1);
    arc(xloc, yloc, r * sqrt(s2), r * sqrt(s2), HALF_PI, PI);
    arc(xloc, yloc, r * sqrt(s4), r * sqrt(s4), HALF_PI + PI, TWO_PI);
    */
    
    ellipseMode(CENTER);
    fill(c1);
    ellipse(xloc, yloc, r * sqrt(s1), r * sqrt(s1));
    
    // 100% guide
    ellipseMode(CENTER);
    noFill();
    guide_col = c1;
    if(s1 > 1.0){ guide_col = color(255); }
    stroke(guide_col);
    ellipse(xloc, yloc, r, r);
    
    // name text
    textSize(r / 5);
    textLeading(r / 5);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    pushMatrix();
    translate(xloc, yloc);
    rotate(rot + HALF_PI);
    text(nm, 0, - 0.9 * r, 1.25 * r, r);
    popMatrix();
    
  }
}
