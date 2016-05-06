void setup()
{
  size(700, 700);
  noStroke();
}

final float side = 100;
final float part = side/2;

float pos_x = 350;
float pos_y = 350;

final color orangy = color(191, 127, 63);
final color greeny = color(63, 191, 63);

void draw()
{
  background(0);
    
  pos_x = mouseX;
  pos_y = mouseY;
  
  if (mousePressed)
  {
    fill(orangy);
    rect(pos_x - part, pos_y - part, side, side);
  }
  else
  {
    fill(greeny);
    ellipse(0, 0, pos_x, pos_y);
  }
  
}