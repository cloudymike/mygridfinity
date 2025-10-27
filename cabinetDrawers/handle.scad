use <MCAD/boxes.scad>

module handle()
{
  height=20;
  translate([0,0,height/2])roundedBox(size=[75,4,height],radius=2,sidesonly=false,$fn=64);
}


handle();
