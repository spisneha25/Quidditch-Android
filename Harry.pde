class Harry{
  float r = 300;   
  float x,y; 
  PImage harryImage;
  
  Harry() {
    x = 0;
    y = 0;
    harryImage = loadImage("mine/harry.png");
  }
  
 void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    image(harryImage, x, y, r, r);
  }
  
  boolean intersect(Ball d) {
    float distance = dist(x , y, d.x, d.y); 
    if (distance < 75) { 
      return true;
    } 
    else {
      return false;
    }
  }
}
