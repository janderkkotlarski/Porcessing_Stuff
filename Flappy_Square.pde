void setup()
{
  size(1000, 700);
  stroke(0);
  
  textSize(32);
}

float wind_x = 1000;
float wind_y = 700;

float flap_x = 0.1*wind_x;
float flap_y = 0.5*wind_y;

float flap_s = 25;

float speed_y = 0;
float max_speed_y = 15;

float delta_speed_y = -10;

float accel_y = 0.5;

float pipe_x = 2*wind_x;
float pipe_y = flap_y;

float delta_x = 15;

float gap_x = 100;
float gap_y = 100;

int score = 0;
int highscore = 0;

boolean scoreable = true;
boolean key_pressed = false;
boolean mouse_pressed = false;
boolean gaming = true;

void draw()
{

  if (!gaming)
  {
    flap_y = 0.5*wind_y;
    speed_y = 0;

    pipe_x = 2*wind_x;
    pipe_y = flap_y;
    
    score = 0;
    
    scoreable = true;    
    key_pressed = false;
    mouse_pressed = false;
    gaming = true;
  }

  background(63, 63, 195);

  fill(195, 63, 63);
  rect(flap_x - flap_s, flap_y - flap_s, 2*flap_s, 2*flap_s);

  fill(63, 195, 63);
  rect(pipe_x, 0, gap_x, pipe_y - gap_y);
  rect(pipe_x, pipe_y + gap_y, gap_x, wind_y);
  
  fill(192, 192, 192);
  text("Score: ", 12, 42);
  text(score, 112, 42);
  
  fill(63, 63, 63);
  text("Highscore: ", wind_x - 240, 42);
  text(highscore, wind_x - 70, 42);

  pipe_x -= delta_x;

  if (pipe_x < -gap_x)
  {
    pipe_x = wind_x;    
    pipe_y = random(gap_y, wind_y - gap_y);
    
    scoreable = true;
  }

  speed_y += accel_y;

  if (keyPressed)
  {
    key_pressed = true;
  }

  if (!keyPressed && key_pressed)
  {
    speed_y = delta_speed_y;
    key_pressed = false;
  }
  
  if (mousePressed)
  {
    mouse_pressed = true;
  }
  
  if (!mousePressed && mouse_pressed)
  {
    speed_y = delta_speed_y;
    mouse_pressed = false;
  }

  if (speed_y > max_speed_y)
  {
    speed_y = max_speed_y;
  }

  flap_y += speed_y;

  if ((((flap_y - flap_s) < (pipe_y - gap_y)) ||
    ((flap_y + flap_s) > (pipe_y + gap_y))) &&
    ((flap_x + flap_s) > pipe_x) &&
    ((flap_x - flap_s) < (pipe_x + gap_x)))
  {
    gaming = false;
  }
  
  if (((flap_x - flap_s) > (pipe_x + gap_x)) &&
      scoreable)
      {
        ++score;
        
        if (score > highscore)
        {
          highscore = score;
        }
        
        scoreable = false;
      }
}