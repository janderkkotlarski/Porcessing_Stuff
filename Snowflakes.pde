final int fps = 50;

final int delta_time = 1000/fps;

int next_flake = 0;

final int symmetry = 6;
final int max_flakes = 10;

final float bez_step = 10;

final float bez_step_x = 2*bez_step;
final float bez_step_y = bez_step;

final float win_dim = 600;

final float cent_min = -3*bez_step;
final float cent_max = win_dim + 3*bez_step;

float cent_x = random(0.15*win_dim, 0.85*win_dim);
float cent_y = cent_min;

final float cent_fall = 0.01*win_dim;

float bez_x[][] = new float [symmetry][4];
float bez_y[][] = new float [symmetry][4];

float bex[] = new float [4];
float bey[] = new float [4];

float dex[] = new float [4];
float dey[] = new float [4];

final float phi = PI/3;

float theta = 0;

final float dheta = 0.025*PI;

int hue = 127;

float[] bexer(final float bez_step_x)
{
  float bez_x[] = new float [4];
  
  bez_x[0] = 0;
  bez_x[1] = -random(bez_step_x);
  bez_x[2] = random(bez_step_x);
  bez_x[3] = random(-bez_step_x, bez_step_x);
  
  return bez_x;
}

float[] beyer(final float bez_step_y)
{
  float bez_y[] = new float [4];
  
  for (int count = 0; count < 4; ++count)
  {
    bez_y[count] = count*bez_step_y;
  }
  
  return bez_y;
}

void mousePressed()
{
  bez_x[0] = bexer(bez_step_x);
}

void setup()
{
  size(600, 600);
  noStroke();
  colorMode(HSB); 
  
  bez_x[0] = bexer(bez_step_x);
  bez_y[0] = beyer(bez_step_y);
}

void draw()
{
  background(0);
  
  fill(hue, 95, 255);  
  
  for (int count = 0; count < 6; ++count)
  {
    for (int count_2 = 0; count_2 < 4; ++count_2)
    {
      final float gamma = count*phi + theta;
      
      bex[count_2] = cent_x + bez_x[0][count_2]*cos(gamma) - bez_y[0][count_2]*sin(gamma);
      bey[count_2] = cent_y + bez_x[0][count_2]*sin(gamma) + bez_y[0][count_2]*cos(gamma);
      
      dex[count_2] = cent_x - bez_x[0][count_2]*cos(gamma) - bez_y[0][count_2]*sin(gamma);
      dey[count_2] = cent_y - bez_x[0][count_2]*sin(gamma) + bez_y[0][count_2]*cos(gamma);
    }
    
    bezier(bex[0], bey[0], bex[1], bey[1], bex[2], bey[2], bex[3], bey[3]);
    bezier(dex[0], dey[0], dex[1], dey[1], dex[2], dey[2], dex[3], dey[3]);
  }
  
  theta += dheta;
  theta %= TWO_PI;
  
  ++hue;
  hue %= 256;
  
  cent_x += random(-0.5*cent_fall, 0.5*cent_fall);
  cent_y += cent_fall;
  
  if (cent_y > cent_max)
  {
    cent_x = random(0.15*win_dim, 0.85*win_dim);
    cent_y = cent_min;
    
    bez_x[0] = bexer(bez_step_x);
  }
  
  int milis = millis() % delta_time;
  
  while (milis > 5)
  {
    milis = millis() % delta_time;
  }
}