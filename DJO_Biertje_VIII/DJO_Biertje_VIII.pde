final int edition = 8;

PFont dafont;

final String borrel = "Vrijwilligers DJO Borrel VIII";
final String make = "MAKE";
final String bere = "BEER";
final String great = "GREAT";
final String again = "AGAIN";

final String wanneer = "3rd of December, 20:45, Café de Minnaar";
final String waar = "Kleine Rozenstraat 64, 9712 TN Groningen";

PImage vlag;
PImage drumpepe;
PImage beer;
PImage reeb;

final float min_x = -25;
final float max_x = 125;

final float min_x_2 = 300;
final float max_x_2 = 400;

final float min_y = 225;
final float max_y = 410;

final float step_y = 75;

void setup()
{  
  size(600, 740);
  
  // dafont = createFont("Comicsans", 30);
  
  // textFont(dafont);
  
  vlag = loadImage("vlag_.png");
  drumpepe = loadImage("drumpepe.png");
  beer = loadImage("nyeer.png");
  reeb = loadImage("reeyn.png");
  
  background(0);  
  image(vlag, 0, 250);  
  
  
  for (int count = 0; count < edition/2; ++count)
  {
    final float posix = random(min_x, max_x);
    
    if (random(1) < 0.5)
    {
      image(beer, posix, min_y + count*step_y);
    }
    else
    {
      image(reeb, posix, min_y + count*step_y);
    }
    
  }
  
  for (int count = 0; count < edition/2; ++count)
  {
    final float posix = random(min_x_2, max_x_2);
    
    if (random(1) < 0.5)
    {
      image(beer, posix, min_y + count*step_y);
    }
    else
    {
      image(reeb, posix, min_y + count*step_y);
    }    
  }
  
  image(drumpepe, 100, 400, 0.65*width, 0.4*height);
  
  fill(0);
  stroke(0);
  rect(0, 0, 600, 250);
  rect(0, 650, 600, 150);
  
  fill(191);  
  textSize(30);  
  text(borrel, 100, 40);
  
  fill(191, 191, 63);   
  textSize(70);
  
  text(make, 60, 125);
  text(bere, 370, 125);
  
  text(great, 50, 215);
  text(again, 340, 215);
  
  fill(191);
  textSize(25);
  
  text(wanneer, 40, 685);
  text(waar, 40, 725);
  
  
}

void draw()
{ 
}