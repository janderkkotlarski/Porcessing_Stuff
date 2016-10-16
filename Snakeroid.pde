final int fps = 25;

final int ms = 1000/fps;

final int tol = 10;

final float win_dim = 600;

final float delta = 2;

final float celta = 0.5*delta;

final float belta = 2*delta;

final float elta = 10*delta;

final float frac = 0.1;

final float flac = 0.02;

boolean[] keyz = new boolean[4];

snake snek = new snake();

void setup()
{
  size(600,600);
  // fill(191, 191, 127);
  noFill();
  
  stroke(63, 191, 63);
  
  strokeWeight(5);
}

void draw()
{
  snek.display();
  snek.check();
  
  while (millis() % ms > tol)
  {
  }  
}

void keyPressed()
{
  if (key == 'w' || key == 'W')  keyz[0] = true;
  if (key == 's' || key == 'S')  keyz[1] = true;
  if (key == 'd' || key == 'D')  keyz[2] = true;
  if (key == 'a' || key == 'A')  keyz[3] = true;
}

void keyReleased()
{
  if (key == 'w' || key == 'W')  keyz[0] = false;
  if (key == 's' || key == 'S')  keyz[1] = false;
  if (key == 'd' || key == 'D')  keyz[2] = false;
  if (key == 'a' || key == 'A')  keyz[3] = false;
}

class snake
{
  float[] pre_x = new float[4], pre_y = new float[4];
  float[] cur_x = new float[4], cur_y = new float[4];
  
  float pos_x, pos_y;
  float rad_2 = 4*elta*elta;
  
  boolean flip = false;
  
  void claire()
  {
    if (flip)
    {
      background(191);
    }
    else
    {
      background(63);
    }
  }
  
  void initiate()
  {
    cur_x[0] = win_dim/2;
    cur_y[0] = win_dim/2;
    
    for (int count = 1; count < 4; ++count)
    {
      cur_x[count] = cur_x[count - 1] + random(-celta, celta);
      cur_y[count] = cur_y[count - 1] + elta;
    }
    
    pos_x = random(elta, win_dim - elta);
    pos_y = random(elta, win_dim - elta);
  }
  
  void move_up()
  {
    if(keyz[0])
    {
      for (int count = 0; count < 4; ++count)
      {
        cur_x[count] -= count*flac*(cur_x[count] - cur_x[0]) + random(-celta, celta);
        
        while(cur_x[count] < 0 || cur_x[count] > win_dim)
        {
          cur_x[count] -= count*flac*(cur_x[count] - cur_x[0]) + random(-celta, celta);
        }
        
        cur_y[count] -= belta;
        
        if (cur_y[count] < 0)
        {
          cur_y[count] = 0;
        }
        
        if (count > 0)
        {
          cur_y[count] += frac*(cur_y[0] + count*elta - cur_y[count]);
        }
      }
    }
  }
  
  void move_down()
  {
    if(keyz[1])
    {
      for (int count = 0; count < 4; ++count)
      {
        cur_x[count] -= count*flac*(cur_x[count] - cur_x[0]) + random(-celta, celta);
        
        while(cur_x[count] < 0 || cur_x[count] > win_dim)
        {
          cur_x[count] -= count*flac*(cur_x[count] - cur_x[0]) + random(-celta, celta);
        }
        
        cur_y[count] += belta;
        
        if (cur_y[count] > win_dim)
        {
          cur_y[count] = win_dim;
        }
        
        if (count > 0)
        {
          cur_y[count] += frac*(cur_y[0] - count*elta - cur_y[count]);
        }
      }
    }
  }
  
  void move_right()
  {
    if(keyz[2])
    {
      for (int count = 0; count < 4; ++count)
      {
        cur_y[count] -= count*flac*(cur_y[count] - cur_y[0]) + random(-celta, celta);
        
        while(cur_y[count] < 0 || cur_y[count] > win_dim)
        {
          cur_y[count] -= count*flac*(cur_y[count] - cur_y[0]) + random(-celta, celta);
        }
        
        cur_x[count] += belta;
        
        if (cur_x[count] > win_dim)
        {
          cur_x[count] = win_dim;
        }
        
        if (count > 0)
        {
          cur_x[count] += frac*(cur_x[0] - count*elta - cur_x[count]);
        }
      }
    }
  }
  
  void move_left()
  {
    if(keyz[3])
    {
      for (int count = 0; count < 4; ++count)
      {
        cur_y[count] -= count*flac*(cur_y[count] - cur_y[0]) + random(-celta, celta);
        
        while(cur_y[count] < 0 || cur_y[count] > win_dim)
        {
          cur_y[count] -= count*flac*(cur_y[count] - cur_y[0]) + random(-celta, celta);
        }
        cur_x[count] -= belta;
        
        if (cur_x[count] < 0)
        {
          cur_x[count] = 0;
        }
        
        if (count > 0)
        {
          cur_x[count] += frac*(cur_x[0] + count*elta - cur_x[count]);
        }
      }
    }
  }
  
  void bezzer()
  {
    bezier(cur_x[0], cur_y[0], cur_x[1], cur_y[1], cur_x[2], cur_y[2], cur_x[3], cur_y[3]);
  }
  
  void display()
  {
    claire();
    bezzer();
  }
  
  void circle_void()
  {
    for (int count = 0; count < 4; ++count)
    {
      final float dex = cur_x[count] - pos_x, dey = cur_y[count] - pos_y;
      
      if (dex*dex + dey*dey <= rad_2)
      {
        initiate();
        flip = !flip;
      }
    }
  }
  
  void check()
  {
    move_up();
    move_down();
    move_right();
    move_left();
    
    circle_void();
  }
  
  snake()
  {
    initiate();
  }
}