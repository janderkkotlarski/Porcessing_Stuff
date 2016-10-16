final float side = 600;
final float beach = 180;
float reach = beach*random(1, 2);
final float baseness = 8;
float thickness = baseness*random(1, 2);
final float divisor = 1.33;
final float shorter = 1.5;
final float delta = 100;
final float init_phi = random(0, TWO_PI);
PVector begint = new PVector(0.5*side, 0.5*side);
final int hydra = 2;

void refract()
{
  reach = beach*random(1.0, 2.0);
  thickness = baseness*random(1.0, 2.0);
  stroke(127 + random(64), 127 + random(64), 127 + random(64));
  background(63, 63, 63);
  begint = new PVector(random(0, side), random(0, side));
  Fractaline fracta = new Fractaline(begint, reach, thickness, init_phi);
  fracta.fractalize();
}

void setup()
{
  size(600, 600); 
  refract();
}

void draw()
{  
}

void mouseClicked()
{
  refract();
}

float phitter(final float phi)
{
  return phi + random(-delta*PI, delta*PI);
}

PVector spanner(final float dist, final float phi)
{
  final PVector span = new PVector(dist*cos(phi), dist*sin(phi));  
  return span;
}

boolean boundy(final float posi)
{
  if (posi < 0 || posi > side)
  {
    return true;
  }
  
  return false;
}

boolean bounder(final PVector posi)
{
  if (boundy(posi.x) || boundy(posi.y))
  {
   return true; 
  }
  
  return false;
}

PVector PVadder(final PVector one, final PVector two)
{
  return new PVector(one.x + two.x, one.y + two.y);
}

class Fractaline
{
  PVector begin, endy, span;
  float dist, strok, phi;
  
  Fractaline(PVector be, float di, float st, float ph)
  {
    begin = be;  
    dist = di;
    strok = st;    
    phi = phitter(ph);
    span = spanner(dist, phi);
    endy = PVadder(begin, span);
    
    while(bounder(endy))
    {
      phi = phitter(phi);
      span = spanner(dist, phi);
      endy = PVadder(begin, span);  
    }        
  }
  
  void fractalize()
  {
    if (strok >= 1)
    {
      for (int count = 0; count < hydra; ++count)
      {
        Fractaline frac = new Fractaline(endy, dist/shorter, strok/divisor, phi);
        frac.fractalize();
      }
    }
    
    strokeWeight(strok);
    stroke(127 + random(64), 127 + random(64), 127 + random(64));    
    line(begin.x, begin.y, endy.x, endy.y);
  }
}