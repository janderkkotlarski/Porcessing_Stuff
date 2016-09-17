final int fps = 50;

final int delta_time = 1000/fps;

final int symmetry = 6;
final int max_flakes = 50;

final float bez_step = 10;

final float bez_step_x = 2*bez_step;
final float bez_step_y = bez_step;

final float bez_delta = 0.03;

final float win_dim = 600;

final float cent_max = -3*bez_step;
final float cent_min = -win_dim + cent_max;

float cent_x[] = new float [max_flakes];
float cent_y[] = new float [max_flakes];

final float fall_min = 0.001*win_dim;
final float fall_max = 0.005*win_dim;

final float fall_delta = 0.01*fall_min;

float cent_fall[] = new float [max_flakes];

final float mult_hori = 0.1;

float cent_hori[] = new float [max_flakes];

float bez_x[][] = new float [max_flakes][4];
float bez_y[][] = new float [max_flakes][4];

float bex[] = new float [4];
float bey[] = new float [4];

float dex[] = new float [4];
float dey[] = new float [4];

final float phi = PI/3;

float theta[] = new float [max_flakes];

final float dheta_max = 0.01*PI;

final float dheta_mult = 0.01;

float dheta[] = new float [max_flakes];

int hue_delta[] = new int [max_flakes];

int hue[] = new int [max_flakes];

final int hue_max = 256;

float[][] bexer(final float bez_step_x, final int max_flakes)
{
  float bez_x[][] = new float [max_flakes][4];
  
  for (int count = 0; count < max_flakes; ++count)
  {  
    bez_x[count][0] = 0;
    bez_x[count][1] = -random(bez_step_x);
    bez_x[count][2] = random(bez_step_x);
    bez_x[count][3] = random(-bez_step_x, bez_step_x);
  }
  
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

float[][] beyyyer(final float bez_step_y,
                  final int max_flakes)
{
  float bez_y[][] = new float [max_flakes][4];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    bez_y[count] = beyer(bez_step_y);
  }
  
  return bez_y;
}

float[] bexxer(final float bex[],
               final float bez_step_x,
               final float delta)
{
  float bez_x[] = new float [4];
  
  bez_x[0] = bex[0];
  
  for (int count = 1; count < 4; ++count)
  {
    bez_x[count] = bex[count] + random(-delta*bez_step_x, delta*bez_step_x);
    
    if (bez_x[count] > bez_step_x)
    {
      bez_x[count] = bez_step_x;
    }
    
    if (bez_x[count] < -bez_step_x)
    {
      bez_x[count] = -bez_step_x;
    }
  }
  
  return bez_x;
}

float[][] bexxxer(final float bex[][],
                  final float bez_step_x,
                  final float delta,
                  final int max_flakes)
{
  float bez_x[][] = new float [max_flakes][4];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    bez_x[count] = bexxer(bex[count], bez_step_x, delta);
  }
  
  return bez_x;
}

float[] horixit(final int max_flakes,
                final float fall_max)
{
  float cenh[] = new float [max_flakes];  
  
  for (int count = 0; count < max_flakes; ++count)
  {
    cenh[count] = random(fall_max, fall_max);    
  }
  
  return cenh;
}

float[] horixer(final float[] cent_hori,
                final int max_flakes,
                final float fall_max,
                final float mult_hori)
{
  float cenh[] = new float [max_flakes];  
  
  for (int count = 0; count < max_flakes; ++count)
  {
    cenh[count] = cent_hori[count] + random(-mult_hori*fall_max, mult_hori*fall_max);
    
    if (cenh[count] > fall_max)
    {
      cenh[count] = fall_max;
    }
    
    if (cenh[count] < -fall_max)
    {
      cenh[count] = -fall_max;
    }
  }
  
  return cenh;
}

float[] centrixit(final int max_flakes,
                  final float win_dim)
{
  float cenx[] = new float [max_flakes];
 
  for (int count = 0; count < max_flakes; ++count)
  {    
    cenx[count] = random(win_dim);    
  }
  
  return cenx;
}

float[] centrixer(final float[] cent_x,
                  final float[] cent_hori,
                  final int max_flakes,
                  final float win_dim)
{
  float cenx[] = new float [max_flakes];
 
  for (int count = 0; count < max_flakes; ++count)
  {    
    cenx[count] = cent_x[count] + cent_hori[count];
    
    if (cenx[count] < 0)
    {
      cenx[count] = win_dim;
    }
    
    if (cenx[count] > win_dim)
    {
      cenx[count] = 0;
    }
  }
  
  return cenx;
}

float[] falliyit(final float fall_min,
                 final float fall_max,
                 final int max_flakes)
{
  float cenf[] = new float [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    cenf[count] = random(fall_min, fall_max);
  }
  
  return cenf;
}

float[] falliyer(final float[] cent_fall,
                 final float fall_delta,
                 final float fall_min,
                 final float fall_max,
                 final int max_flakes)
{
  float cenf[] = new float [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    cenf[count] = cent_fall[count] + random(-fall_delta, fall_delta);
    
    if (cenf[count] > fall_max)
    {
      cenf[count] = fall_max;
    }
    
    if (cenf[count] < fall_min)
    {
      cenf[count] = fall_min;
    }
  }
  
  return cenf;
}

float[] centriyit(final int max_flakes,
                  final float cent_min,
                  final float cent_max)
{
  float ceny[] = new float [max_flakes];
 
  for (int count = 0; count < max_flakes; ++count)
  {    
    ceny[count] = random(cent_min, cent_max);
  }
  
  return ceny;
}

float[] centriyer(final float[] cent_y,
                  final float[] cent_fall,
                  final int max_flakes,
                  final float win_dim)
{
  float ceny[] = new float [max_flakes];
 
  for (int count = 0; count < max_flakes; ++count)
  {    
    ceny[count] = cent_y[count] + cent_fall[count];
    
    if (ceny[count] > win_dim)
    {
      ceny[count] = 0;
    }
  }
  
  return ceny;
}

float[] dhetit(final int max_flakes,
               final float dheta_max)
{
  float dhet[] = new float [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    dhet[count] = random(-dheta_max, dheta_max);
  }
  
  return dhet;
}

float[] dhetys(final float dheta[],
               final int max_flakes,
               final float dheta_max,
               final float dheta_mult)
{
  float dhet[] = new float [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    dhet[count] = dheta[count] + dheta_mult*random(-dheta_max, dheta_max);
    
    if (dhet[count] > dheta_max)
    {
      dhet[count] = dheta_max;
    }
    
    if (dhet[count] < -dheta_max)
    {
      dhet[count] = -dheta_max;
    }
  }
  
  return dhet;
}

float[] thetit(final int max_flakes)
{
  float thet[] = new float [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    thet[count] = random(TWO_PI);
  }
  
  return thet;
}

float[] thetys(final float theta[],
               final float dheta[],
               final int max_flakes)
{
  float thet[] = new float [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    thet[count] = theta[count] + dheta[count];
  }
  
  return thet;
}

int[] hue_del(final int max_flakes)
{
  int hue_delta[] = new int [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    hue_delta[count] = 2*round(random(1)) - 1;
  }
  
  return hue_delta;
}

int[] hue_init(final int hue_max,
               final int max_flakes)
{
  int hue[] = new int [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    hue[count] = floor(random(hue_max));
  }
  
  return hue;
}

int[] hue_chan(final int huec[],
               final int hue_delta[],
               final int hue_max,
               final int max_flakes)
{
  int hue[] = new int [max_flakes];
  
  for (int count = 0; count < max_flakes; ++count)
  {
    hue[count] = huec[count] + hue_delta[count];
    
    if (hue[count] > hue_max)
    {
      hue[count] -= hue_max;
    }
    
    if (hue[count] < 0)
    {
      hue[count] += hue_max;
    }
  }
  
  return hue;
}

void mousePressed()
{
  for (int count = 0; count < max_flakes; ++count)
  {
    bez_x = bexer(bez_step_x, max_flakes);
  }
}

void setup()
{
  size(600, 600);
  noStroke();
  colorMode(HSB); 
  
  cent_hori = horixit(max_flakes, fall_max);  
  cent_fall = falliyit(fall_min, fall_max, max_flakes);
  
  cent_x = centrixit(max_flakes, win_dim);
  cent_y = centriyit(max_flakes, cent_min, cent_max);  
  
  bez_x = bexer(bez_step_x, max_flakes);
  bez_y = beyyyer(bez_step_y, max_flakes);
  
  dheta = dhetit(max_flakes, dheta_max);
  theta = thetit(max_flakes);
  
  hue_delta = hue_del(max_flakes);
  hue = hue_init(hue_max, max_flakes);  
}

void draw()
{
  background(0);  
    
  for (int count_3 = 0; count_3 < max_flakes; ++count_3)
  {
    fill(hue[count_3], 95, 255);
    
    for (int count = 0; count < 6; ++count)
    {
      for (int count_2 = 0; count_2 < 4; ++count_2)
      {
        final float gamma = count*phi + theta[count_3];
        
        bex[count_2] = cent_x[count_3] + bez_x[count_3][count_2]*cos(gamma) - bez_y[count_3][count_2]*sin(gamma);
        bey[count_2] = cent_y[count_3] + bez_x[count_3][count_2]*sin(gamma) + bez_y[count_3][count_2]*cos(gamma);
        
        dex[count_2] = cent_x[count_3] - bez_x[count_3][count_2]*cos(gamma) - bez_y[count_3][count_2]*sin(gamma);
        dey[count_2] = cent_y[count_3] - bez_x[count_3][count_2]*sin(gamma) + bez_y[count_3][count_2]*cos(gamma);
      }
      
      bezier(bex[0], bey[0], bex[1], bey[1], bex[2], bey[2], bex[3], bey[3]);
      bezier(dex[0], dey[0], dex[1], dey[1], dex[2], dey[2], dex[3], dey[3]);
    }
  }
  
  dheta = dhetys(dheta, max_flakes, dheta_max, dheta_mult);  
  theta = thetys(theta, dheta, max_flakes);  
  
  hue = hue_chan(hue, hue_delta, hue_max, max_flakes);
 
  bez_x = bexxxer(bez_x, bez_step_x, bez_delta, max_flakes);
  
  cent_hori = horixer(cent_hori, max_flakes, fall_max, mult_hori);  
  cent_x = centrixer(cent_x, cent_hori, max_flakes, win_dim);
  
  cent_fall = falliyer(cent_fall, fall_delta, fall_min, fall_max, max_flakes);
  cent_y = centriyer(cent_y, cent_fall, max_flakes, win_dim);
  
  int milis = millis() % delta_time;
  
  while (milis > 5)
  {
    milis = millis() % delta_time;
  }
}