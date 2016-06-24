void setup()
{
  size(1000, 700);
  stroke(0);
}

final float wind_x = 1000;
final float wind_y = 700;

float square_x = 0.5*wind_x;
float square_y = 0.5*wind_y;

float speed_x = 0;
float speed_y = 0;

final float speed_m = 100;

final float accel_x = 0.1;
final float accel_y = 0.1;

final float square_s = 0.025*wind_x;

final float drag = 0.999;

void draw()
{
  background(0);
  fill(191, 128, 63);
  rect(square_x - square_s, square_y - square_s, square_s + square_s, square_s + square_s);
  
  if (keyPressed)
  {
    if (key == 'd')
    {
      speed_x += accel_x;
    }
    
    if (key == 'a')
    {
      speed_x -= accel_x;
    }    
  }
  
  if (abs(speed_x) > speed_m)
  {
    speed_x = speed_m*speed_x/abs(speed_x);
  }
  
  if (abs(speed_y) > speed_m)
  {
    speed_y = speed_m*speed_y/abs(speed_y);
  }
  
  speed_x *= drag;
  square_x += speed_x;
  
  speed_y += accel_y;
  speed_y *= drag;
  square_y += speed_y;
  
  if ((square_x + square_s) > wind_x)
  {
    speed_x *= -1;
    square_x = wind_x + wind_x - square_x - square_s - square_s;
  }
  
  if ((square_x - square_s) < 0)
  {
    speed_x *= -1;
    square_x = -square_x + square_s + square_s;
  }
  
  if ((square_y + square_s) > wind_y)
  {
    speed_y *= -1;
    square_y = wind_y + wind_y - square_y - square_s - square_s;
  }  
}