final float wind = 700;



PVector accel = new PVector(0, 0.001*wind);

final float delta = 0.001;



final PVector speed_max = new PVector(0.01*wind, 0.02*wind);

PVector speed = new PVector(0, 0);

final float side = 0.05*wind;
final float dist = 0.5*side;

final PVector sides = new PVector(side, side);

PVector start_pos = new PVector(0.5*wind, 0.9*wind);

PVector warpos = start_pos;

PVector jumpos = new PVector(warpos.x, warpos.y - side);

PVector plus = new PVector(0, 0);
PVector nega = new PVector(0, 0);
PVector abspos = new PVector(0, 0);

final int jump_max = 2;

int jumps = jump_max;

boolean pressing = false;

final int period = 120;

int timer = period;

float collitector(final float jumpo_1, final float jumpo_2,
                  final float warpo_1, final float warpo_2, final float side)
{  
  final float plus = jumpo_2 + warpo_1 - warpo_2;
  final float nega = -jumpo_2 + warpo_1 + warpo_2;  
  final float abspo = abs(jumpo_1 - warpo_1) + warpo_1;  
  float jumpout = jumpo_1;
  
  if ((abspo > plus) && (abspo > nega) && (abspo < warpo_1 + side))
  {
    if (jumpo_1 > warpo_1)
    {
      jumpout = warpo_1 + side;
    }
    else
    {
      jumpout = warpo_1 - side;
    }
  }
  
  return jumpout;
}

void setup()
{
  size(700, 700);
  noStroke();
  textSize(0.05*wind);
}

void draw()
{
  background(0);
  
  fill(191, 127, 63);
  rect(jumpos.x - dist, jumpos.y - dist, side, side);
  
  fill(63, 127, 191);
  rect(warpos.x - dist, warpos.y - dist, side, side);
  
  speed.set(0, speed.y + accel.y);
  
  if (keyPressed)
  {
   if ((key == 'd') || (key == 'e'))
   {
     speed.x = speed_max.x;
   }
  
   if ((key == 'a') || (key == 'q'))
   {
     speed.x = -speed_max.x;
   }
  
   if (((key == 'w') || (key == 'e') || (key == 'q')) &&
       !pressing && (jumps > 0))
   {
     speed.y = -speed_max.y;
     pressing = true;
     --jumps;
   }
   
  }
  else if (pressing)
  {
    pressing = false;
  }
  
  if (speed.y > speed_max.y)
  {
    speed.y = speed_max.y;
  }
    
  jumpos.add(speed);
  
  if (jumpos.y + dist > wind)
  {
    jumpos.y = wind - dist;
    speed.y = 0;
    jumps = 2;
  }
  
  final float tempos_x = collitector(jumpos.x, jumpos.y, warpos.x, warpos.y, side);
    
  if (abs(tempos_x - jumpos.x) > delta*abs(speed.x))
  {
    jumpos.x = tempos_x;
    speed.x = 0;
    jumps = 2;
  }
  
  final float tempos_y = collitector(jumpos.y, jumpos.x, warpos.y, warpos.x, side);
    
  if (abs(tempos_y - jumpos.y) > delta*abs(speed.y))
  {
    jumpos.y = tempos_y;
    speed.y = 0;
    jumps = 2;
  }
  
  --timer;
  
  if (timer < 1)
  {
    warpos.x = random(0.2*wind, 0.8*wind);
    warpos.y = random(0.2*wind, 0.8*wind);
    
    timer = period;
  }
}