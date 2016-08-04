void setup()
{
  size(600, 600);
}

void draw()
{
  background(0);
  for (int count = 0; count <= 300; count+=10)
  {
     stroke(count/2, 256 - count/2, (mouseX/2 + mouseY/2)%256);
     line(count, 0, 0, 300 - count);
     line(count, 300, 300, 300 - count);
     line(count, 600, 0, 300 + count);
     line(count, 300, 300, 300 + count);
     line(600, 300 - count, 600 - count, 0);
     line(300, 300 - count, 600 - count, 300);
     line(600, 300 + count, 600 - count, 600);
     line(300, 300 + count, 600 - count, 300);
  }
}