Harry harry;    // One catcher object
Timer timer;        // One timer object
Ball[] balls;       // An array of drop objects
int totalballs = 0, score = 0; // totalDrops
PImage bckgImage1, bckgImage2, ringImage;
AudioPlayer catchSound, bckgSound;
Maxim maxim;
int f = 1;
Toggle t;
Slider s;

void setup() {
  size(1200,768);
  smooth();
  
  s = new Slider("Volume", 1, 0, 5, 10, 60, 120, 20, HORIZONTAL);
  t = new Toggle("Change Background", 10, 30, 125, 20);
  bckgImage2 = loadImage("mine/bg3.jpg");
  bckgImage1 = loadImage("mine/bg1.jpg");
  ringImage = loadImage("mine/r3.png");
  maxim = new Maxim(this);
  harry = new Harry(); // Create the catcher with a radius of 32
  balls = new Ball[100];    // Create 1000 spots in the array
  timer = new Timer(300);   // Create a timer that goes off every 2 seconds
  timer.start();      
  catchSound = maxim.loadFile("noise1.wav");
  catchSound.setLooping(false);
  catchSound.volume(1.0);  // Starting the timer
  bckgSound = maxim.loadFile("mine/bckg1.wav");
  bckgSound.setLooping(true);
  bckgSound.volume(0.75);
  bckgSound.play();
}

void draw() {
  image(bckgImage2, 0, 0, width, height); 
  image(ringImage, width*1/2 - 22, height*1/4, 100, 100);
  image(ringImage, width*1/2 - 372, height*1/4, 100, 100);
  image(ringImage, width*1/2 + 332, height*1/4, 100, 100);
  t.display();
  s.display();
  if(t.get())
   {
     image(bckgImage1, 0, 0, width, height); 
     image(ringImage, width*1/2 - 22, height*1/4, 100, 100);
     image(ringImage, width*1/2 - 372, height*1/4, 100, 100);
     image(ringImage, width*1/2 + 332, height*1/4, 100, 100);
     t.display();
     s.display();
   }
  harry.setLocation(mouseX, mouseY);
  harry.display(); 
  fill(255);
  text("Score: " + score, 20, 20);
  bckgSound.volume(s.get()*0.2);
  if (timer.isFinished()) {
    balls[totalballs] = new Ball();
    totalballs ++ ;
    if (totalballs >= balls.length) {
      totalballs = 0;                                                                         // Start over
    }
    timer.start();
  }
  
  for (int i = 0; i < totalballs; i++ ) 
  {
    balls[i].move();
    balls[i].display();
    
    if(harry.intersect(balls[i])) 
    {
       balls[i].caught();
       catchSound.cue(0);
       catchSound.speed(1);
       catchSound.play();
       score += 10;
       f = 0;
    }
  }
}

void mouseReleased()
{
  t.mouseReleased();
  s.mouseReleased();  
}

void mouseDragged()
{
  t.mouseDragged();
  s.mouseDragged();
}

void mousePressed()
{
  t.mousePressed();
  s.mousePressed();
}


