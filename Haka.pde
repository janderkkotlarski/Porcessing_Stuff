void setup()
{
  size(600, 600);
  noStroke();
}

void draw()
{
  background(0);
  fill(191, 127, 63);
  ellipse(300, 300, 100, 100);
  fill(63, 127, 191);
  ellipse(400, 300, 100, 100);
  ellipse(200, 300, 100, 100);
  ellipse(350, 386, 100, 100);
  ellipse(350, 214, 100, 100);
  ellipse(250, 386, 100, 100);
  ellipse(250, 214, 100, 100);
  fill(127, 191, 63);
  ellipse(100, 300, 100, 100);
  ellipse(500, 300, 100, 100);
  ellipse(450, 386, 100, 100);
  ellipse(150, 386, 100, 100);
  ellipse(450, 214, 100, 100);
  ellipse(150, 214, 100, 100);
  ellipse(200, 472, 100, 100);
  ellipse(300, 472, 100, 100);
  ellipse(400, 472, 100, 100);
  ellipse(200, 128, 100, 100);
  ellipse(300, 128, 100, 100);
  ellipse(400, 128, 100, 100);
  fill(191);
  for (int count = 0; count <= 30; ++count)
  {
    ellipse(20*count, 10*count, 4, 4);
  }
}