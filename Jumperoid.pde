final float wind_x = 700;
final float wind_y = 700;

final float accel_y = 0.001*wind_y;

final float speed_x_max = 0.005*wind_x;
final float speed_y_max = 0.01*wind_y;

float speed_y = 0;

float posit_x = 0.5*wind_x;
float posit_y = 0.5*wind_y;

final float dist_x = 0.01*wind_x;
final float dist_y = 0.01*wind_y;

void setup()
{
  size(700, 700);
}

void draw()
{
  background(0);
  
  fill(192, 127, 63);
  rect(posit_x - dist_x, posit_y - dist_y, 2*dist_x, 2*dist_y);
  
  if (keyPressed)
  {
   if (key == 'd')
   {
     posit_x += speed_x_max;
   }
   
   if (key == 'a')
   {
     posit_x -= speed_x_max;
   }
   
   if (key == 'w')
   {
     posit_y -= speed_y_max;
   }
    
  }
}