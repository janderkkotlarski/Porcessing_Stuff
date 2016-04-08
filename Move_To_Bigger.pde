void setup()
{
  size(700, 700);
  background(0);
  stroke(255);
  fill (195, 63, 195);
}

float current_x = 0;
float current_y = 0;

float last_x = 0;
float last_y = 0;

float size_x = 0;
float size_y = 0;

float mult = 2;

void draw()
{
  background(0);

  last_x = current_x;
  last_y = current_y;

  current_x = mouseX;
  current_y = mouseY;

  size_x = (current_x - last_x)*(current_y - last_y);
  size_y = mult*((current_x - last_x) + (current_y - last_y));

  rect(current_x, current_y, size_x, size_y);

  while ((millis() % 100) < 90)
  {
  }
}