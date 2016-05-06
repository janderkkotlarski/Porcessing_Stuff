void setup()
{
  size(700, 700);
  noStroke();
}

final float side = 100;
final float part = side/2;

float pos_x = 350;
float pos_y = 350;

void draw()
{
  background(0);
  fill(191, 127, 63);
  
  pos_x = mouseX;
  pos_y = mouseY;
  
  if (mousePressed)
  {
    rect(pos_x - part, pos_y - part, side, side);
  }
  
  
}