
CountryPoint cp;

void setup(){
  size(500, 500);
  cp = new CountryPoint(50, 50, 100);
}

void draw(){
  background(0);
  
  cp.display();
}


class CountryPoint {
 float xloc,yloc, s;
 
 CountryPoint(float x, float y, float size){
   xloc = x;
   yloc = y;
   s = size;
 }
 
 void display(){
  rect(xloc, yloc, s, s); 
 }
}
