class Ball{
  float x,y;   
  float speed; 
  float r; 
  int c = 0;
  PImage ballImage;

  Ball() {
    r = 60;                 
    x = ((int)random(3))* 350 + (width / 2) - 350;     
    y = height;              
    speed = random(12,15);
    ballImage = loadImage("mine/b2.png");
  }

  void move() {
       pushMatrix();
       translate(0, -speed);
       image(ballImage, x, y, r, r);
       popMatrix();
       y -= speed;  
  }
 
  boolean reachedBottom() {
    if (y < height/4) { 
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    //image(ballImage, x, y, r, r);    
    if(reachedBottom())
      caught();
  }

  void caught() {
    speed = 0; 
    y = - 1000;
  }
}
