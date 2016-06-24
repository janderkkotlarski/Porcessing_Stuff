final float wind = 700;

PVector accel = new PVector(0, 0.0015*wind);

final PVector speed_max = new PVector(0.015*wind, 0.02*wind);

PVector speed = new PVector(0, 0);
PVector speed_null = speed;

final float side = 0.05*wind;
final float dist = 0.5*side;

final float delta = 0.01*side;

final PVector sides = new PVector(side, side);

PVector start_pos = new PVector(0.5*wind, 0.5*wind);

PVector warpos = start_pos;

PVector jumpos = new PVector(warpos.x, warpos.y - side);

PVector plus = new PVector(0, 0);
PVector nega = new PVector(0, 0);
PVector abspos = new PVector(0, 0);

final int jump_max = 2;

int jumps = jump_max;

boolean pressing = false;

final int period = 60;

int timer = period;

int score = 0;
float score_x = 0.05*wind;
float score_y = 0.05*wind;
float score_w = 0.15*wind;

int hiscore = 0;
float hiscore_x = 0.65*wind;
float hiscore_y = 0.05*wind;
float hiscore_w = 0.20*wind;

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
  PVector reset_pos = start_pos;
  
  background(0);
  
  fill(191, 127, 63);
  rect(jumpos.x - dist, jumpos.y - dist, side, side);
  
  fill(63, 127, 191);
  rect(warpos.x - dist, warpos.y - dist, side, side);
  
  fill(63, 191, 127);
  text("Score: ", score_x, score_y);
  text(score, score_x + score_w, score_y);
  
  fill(127, 191, 191);
  text("Hiscore: ", hiscore_x, hiscore_y);
  text(hiscore, hiscore_x + hiscore_w, hiscore_y);
  
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
     
     if ((jumps == 1) && ((jumpos.y + side) < (warpos.y + delta)) && ((jumpos.y + side) > (warpos.y - delta)) &&
         ((jumpos.x + side) >= warpos.x) && ((jumpos.x - side) <= warpos.x))
      {
        warpos.x = -wind;
        warpos.y = -wind;
        
        while ((warpos.x < dist) || (warpos.x > wind - dist) ||
               (warpos.y < dist) || (warpos.y > wind - dist))
        {
          warpos.x = random(jumpos.x + 2*side, jumpos.x + 4*side);
          warpos.y = random(jumpos.y - 4*side, jumpos.y + 4*side);
          
          if (random(0, 1) > 0.5)
          {
            warpos.x = 2*jumpos.x - warpos.x;
          }
        }
        
        timer = period;
        ++score;
        
        if (score > hiscore)
        {
          hiscore = score; 
        }
      }
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
    warpos.x = -wind;
    warpos.y = -wind;
    
    while ((warpos.x < 3*side) || (warpos.x > wind - 3*side) ||
           (warpos.y < 3*side) || (warpos.y > wind - 3*side))
    {
      warpos.x = random(jumpos.x + 2*side, jumpos.x + 4*side);
      warpos.y = random(jumpos.y - 4*side, jumpos.y + 4*side);
      
      if (random(0, 1) > 0.5)
      {
        warpos.x = 2*jumpos.x - warpos.x;
      }
    }
    
    timer = period;
    ++score;
    
    if (score > hiscore)
    {
      hiscore = score; 
    }
  }
  
  if ((jumpos.x - dist < 0) || (jumpos.x + dist > wind) ||
      (jumpos.y - dist < 0) || (jumpos.y + dist > wind))
  {
    warpos = new PVector(0.5*wind, 0.5*wind);
    jumpos = new PVector(warpos.x, warpos.y - side);
    speed = new PVector(0, 0);
    jumps = 2;
    score = 0;
    timer = period;
  }
}