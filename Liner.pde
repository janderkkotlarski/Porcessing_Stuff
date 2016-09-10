final float wide = 600;
final float dist = 100;
final float delta = 10;
final float step = 50;

float phi = random(-1, 1)*PI;

final int delta_time = 125;

float start_x = random(dist, wide - dist);
float start_y = random(dist, wide - dist);

float end_x = 0;
float end_y = 0;

void setup()
{
 size(600, 600);
 background(0);
 stroke(255);
 colorMode(HSB);
}

void draw()
{ 
  end_x = 0;
  end_y = 0;
  
  while (end_x < delta || end_y < delta || end_x > wide - delta || end_y > wide - delta)
  {
    // final float reach = random(delta, dist);
    phi += random(-0.25, 0.25)*PI;
    
    end_x = start_x + step*cos(phi);
    end_y = start_y + step*sin(phi);
  }
  
  stroke(random(255), random(255), 255);
  
  line(start_x, start_y, end_x, end_y);
  
  start_x = end_x;
  start_y = end_y;
  
  int milis = millis() % delta_time;
  
  while (milis > 1)
  {
    milis = millis() % delta_time;
  }
}