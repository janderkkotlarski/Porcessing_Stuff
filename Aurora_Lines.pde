final int fps = 8;

final int delta_time = 1000/fps;

final float wind_x = 800;
final float wind_y = 600;

float middle_x = random(0.1, 0.9)*wind_x;

float middle_mult = random(0.3, 0.7);
float middle_y = -middle_mult*wind_x;

float rad_min = 1.2*middle_mult*wind_x;
float rad_max = 1.6*middle_mult*wind_x;

final int divs = 400;

float phi_min = -random(0.1, 0.4)*PI;
float phi_max = random(0.1, 0.4)*PI;

float phi_div = (phi_max - phi_min)/divs;

final float mult_min = 1.05;
final float mult_max = 1.25;

final float wane = 0.994;
final float wax = 1/wane;

int color_choice = floor(random(0, 6));

float rad_v[] = new float [divs + 1];
float rad_w[] = new float [divs + 1];

float v_x[] = new float [divs + 1];
float v_y[] = new float [divs + 1];

float w_x[] = new float [divs + 1];
float w_y[] = new float [divs + 1];

int red = 0;
int green = 0;
int blue = 0;

boolean clicked = false;


void setup()
{
  size(800, 600);
  
  rad_v[0] = random(rad_min, rad_max);
  rad_w[0] = random(mult_min, mult_max)*rad_v[0];
  
  for (int count = 1; count <= divs; ++count)
  {
    rad_v[count] = rad_v[count - 1]*random(wane, wax);
    rad_w[count] = rad_w[count - 1]*random(wane, wax);
  }
  
  for (int count = 0; count <= divs; ++count)
  {
    final float phi = phi_div*count + phi_min;
    
    v_x[count] = middle_x + rad_v[count]*sin(phi);
    v_y[count] = middle_y + rad_v[count]*cos(phi);
    
    w_x[count] = middle_x + rad_w[count]*sin(phi);
    w_y[count] = middle_y + rad_w[count]*cos(phi);
  }
  
  if (color_choice == 0)
  {
    red = 127;
  }
  
  if (color_choice == 1)
  {
    green = 127;
  }
  
  if (color_choice == 2)
  {
    blue = 127;
  }
  
  if (color_choice == 3)
  {
    red = 127;
    green = 127;
  }
  
  if (color_choice == 4)
  {
    green = 127;
    blue = 127;
  }
  
  if (color_choice == 5)
  {
     red = 127;
    blue = 127;
  }
}

void draw()
{
  if (mousePressed && !clicked)
  {
    clicked = true;
    
    middle_x = random(0.1, 0.9)*wind_x;

    middle_mult = random(0.3, 0.7);
    middle_y = -middle_mult*wind_x;
    
    rad_min = 1.2*middle_mult*wind_x;
    rad_max = 1.6*middle_mult*wind_x;
    
    phi_min = -random(0.1, 0.4)*PI;
    phi_max = random(0.1, 0.4)*PI;

    phi_div = (phi_max - phi_min)/divs;
    
    rad_v[0] = random(rad_min, rad_max);
    rad_w[0] = random(mult_min, mult_max)*rad_v[0];
    
    for (int count = 1; count <= divs; ++count)
    {
      rad_v[count] = rad_v[count - 1]*random(wane, wax);
      rad_w[count] = rad_w[count - 1]*random(wane, wax);
    }
    
    for (int count = 0; count <= divs; ++count)
    {
      final float phi = phi_div*count + phi_min;
      
      v_x[count] = middle_x + rad_v[count]*sin(phi);
      v_y[count] = middle_y + rad_v[count]*cos(phi);
      
      w_x[count] = middle_x + rad_w[count]*sin(phi);
      w_y[count] = middle_y + rad_w[count]*cos(phi);
    }
    
    color_choice = floor(random(0, 6));
    
    red = 0;
    green = 0;
    blue = 0;
    
    if (color_choice == 0)
    {
      red = 127;
    }
    
    if (color_choice == 1)
    {
      green = 127;
    }
    
    if (color_choice == 2)
    {
      blue = 127;
    }
    
    if (color_choice == 3)
    {
      red = 127;
      green = 127;
    }
    
    if (color_choice == 4)
    {
      green = 127;
      blue = 127;
    }
    
    if (color_choice == 5)
    {
       red = 127;
      blue = 127;
    }
  }
  
  if (!mousePressed && clicked)
  {
    clicked = false;
  }
  
  background(8, 4, 16);
  
  for (int count = 0; count <= divs; ++count)
  {
    
    stroke(red + random(127), green + random(127), blue + random(127));
    line(v_x[count], v_y[count], w_x[count], w_y[count]);
  }
  
  for (int count = 0; count <= divs; ++count)
  {
    rad_v[count] *= random(wane, wax);
    rad_w[count] *= random(wane, wax);
  
    final float phi = phi_div*count + phi_min;
    
    v_x[count] = middle_x + rad_v[count]*sin(phi);
    v_y[count] = middle_y + rad_v[count]*cos(phi);
    
    w_x[count] = middle_x + rad_w[count]*sin(phi);
    w_y[count] = middle_y + rad_w[count]*cos(phi);
  }
  
  int milis = millis() % delta_time;
  
  while (milis > 5)
  {
    milis = millis() % delta_time;
  }
}