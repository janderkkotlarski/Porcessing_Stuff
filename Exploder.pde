int boom_x = 0;
int boom_y = 0;

final int boom_mult = 10;
int boom_timer = 0;
int boom_trans = 0;

int boom_rad = 0;

final int delta_timer = 15;
final int delta_trans = 12;

final int full_byte = 255;

boolean boomer = false;

final int player_dia = 10;

final int enemy_count = 100;
final int enemy_rad = 5;

boolean[] enemy_b = new boolean[enemy_count];
int[] enemy_r = new int[enemy_count];
int[] enemy_x = new int[enemy_count];
int[] enemy_y = new int[enemy_count];
int[] speed_x = new int[enemy_count];
int[] speed_y = new int[enemy_count];

int enemy_n = 0;

int wind = 700;

void setup()
{
  size(700, 700);
  background(0);
  noStroke();
  textSize(32);
  
  for (int count = 0; count < enemy_count; ++count)
  {
    enemy_b[count] = true;
    enemy_r[count] = enemy_rad; // round(random(enemy_rad, enemy_rad + enemy_rad + 1));
    enemy_x[count] = round(random(enemy_rad, wind - enemy_rad + 1));
    enemy_y[count] = round(random(enemy_rad, wind - enemy_rad + 1));
    speed_x[count] = round(2*random(-enemy_rad/2 - 1, enemy_rad/2 + 1) + 1);
    speed_y[count] = round(2*random(-enemy_rad/2 - 1, enemy_rad/2 + 1) - 1);
  }
}



void draw()
{
  background(0);
  if (mousePressed && !boomer)
  {
    boomer = true;
    
    boom_timer = full_byte;
    boom_trans = full_byte;
    boom_rad = 0;
    
    boom_x = mouseX;
    boom_y = mouseY;       
  }
  
  if (boomer)
  {
    boom_timer -= delta_timer;
    boom_trans -= delta_trans;
    boom_rad += boom_mult;
    
    if (boom_timer < 0)
    {
      boom_timer = 0;
      boom_trans += delta_trans;
      boom_rad -= boom_mult;
    }
    else
    {
      fill(63, 127, 191, boom_trans);
      ellipse(boom_x, boom_y, 2*boom_rad, 2*boom_rad);
    }
    
    if (boom_timer == 0 && !mousePressed)
    {
      boomer = false;
      boom_rad = 0;
      boom_trans = 0;
    }
  }
  
  fill(191, 191, 63);
  ellipse(mouseX, mouseY, player_dia, player_dia);
  
  enemy_n = 0;
  fill(191, 63, 63);
  for (int count = 0; count < enemy_count; ++count)
  {
    if (enemy_b[count])
    {
      ellipse(enemy_x[count], enemy_y[count], enemy_r[count], enemy_r[count]);
      ++enemy_n;
    }
  }
  
  for (int count = 0; count < enemy_count; ++count)
  {
    if (enemy_b[count])
    {
      enemy_x[count] += speed_x[count];
      
      if (enemy_x[count] < 0)
      {
        enemy_x[count] += wind;
      }
      
      if (enemy_x[count] > wind)
      {
        enemy_x[count] -= wind;
      }
      
      enemy_y[count] += speed_y[count];
      
      if (enemy_y[count] < 0)
      {
        enemy_y[count] += wind;
      }
      
      if (enemy_y[count] > wind)
      {
        enemy_y[count] -= wind;
      }
      
      final int dist_x = boom_x - enemy_x[count];
      final int dist_y = boom_y - enemy_y[count];
      final int dist_s = dist_x*dist_x + dist_y*dist_y;
      
      final int radius_r = enemy_r[count] + boom_rad;
      final int radius_s = radius_r*radius_r;
      
      if (dist_s < radius_s)
      {
        enemy_b[count] = false;
      }
    }
    else
    {
      if (random(25*enemy_count) < 1)
      {
        enemy_b[count] = true;
      }
    }
    
  } 
  
  fill(191, 191, 191);
  
  text("Enemies: ", 220, 40); 
  text(enemy_n, 380, 40);
  
  if (enemy_n == 0)
  {
    exit();
  }
}