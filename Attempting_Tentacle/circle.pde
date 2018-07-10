class Circle {
 
  float x,y; // location
  float dim; // dimension
  //color c; // color
  
  Circle(float x, float y) {
    this.x = x;
    this.y = y;
    this.dim = 20;
  }
  
  void display() {
    ellipse(x, y, dim, dim);
  }
  
}