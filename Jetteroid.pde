Jitteroid jit = new Jitteroid(10, 10, 50, 600);

void setup()
{
  size(600, 600);
  
  background(127);
  
  strokeWeight(2);
  
  frameRate(40);
}



void draw()
{
  
  
  jit.jitter();
  
  jit.display();
}

class Jitteroid
{
  float x_pos, y_pos, x_max, y_max, diam, win;
  
  Jitteroid(float xm, float ym,
            float d, float w)
  {
    win = w;
    x_pos = random(win);
    y_pos = random(win);
    x_max = xm;
    y_max = ym;
    diam = d;
  }
  
  void jitter()
  {
    x_pos += random(-x_max, x_max);
    
    while (x_pos < 0 || x_pos > win)
    {
      x_pos += random(-x_max, x_max);
    }
    
    y_pos += random(-y_max, y_max);
    
    while (y_pos < 0 || y_pos > win)
    {
      y_pos += random(-y_max, y_max);
    }
  }
  
  void display()
  {
    ellipse(x_pos, y_pos, diam, diam);
  }
  
}