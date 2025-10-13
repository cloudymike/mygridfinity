use <../gridfinity-rebuilt-openscad/gridfinity-rebuilt-bins.scad>

// Srewdriver handle holder
// Tries to pack as many as possible based on tile size
// Does not try to make it symmetric

$fn=120;
OverExtrusion = 0.2;
theanswer=42;
height7=2;
height = height7*7;
interval = 16.5;
diameter=36+2*OverExtrusion;

topadjust = height7==3 ? -4 : height7==2 ? -7 : height7==1 ? -10 : 0  ; 

BoxUnits=42;
BoxLengthUnits=2;
BoxWidthUnits=5;
StyleHole=0; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit, 4: Gridfinity Refined hole - no glue needed]
WallAdjust = 2;

module bottom(
  BoxLengthUnits=2,
  BoxWidthUnits=5,
  height7=3)

{
  union () {
    gridfinityBase(
      gx=BoxLengthUnits, 
      gy=BoxWidthUnits, 
      l=theanswer, 
      dx=0, 
      dy=0, 
      style_hole=StyleHole 
    );
  }
}

module top(  dxf="dupontcrimp.dxf",
  BoxLengthUnits=2,
  BoxWidthUnits=5,
  height7=3)

{

//  boxfill(dxf);

difference () {
  translate([0,0,20])linear_extrude(height = height, center = true, convexity = 10) import (file = dxf);
  boxtrim(dxf);
  }
}

module boxfill(dxf="dupontcrimp.dxf")
{

difference () {
    gridfinityInit(BoxLengthUnits, BoxWidthUnits, height-5, 0, theanswer) {}
  translate([0,0,12])linear_extrude(height = height, center = true, convexity = 10) import (file = dxf);
  
}
}
module boxtrim(  dxf="dupontcrimp.dxf",
  BoxLengthUnits=2,
  BoxWidthUnits=5,
  height7=3)

{
height = height7*7;

difference () {
  translate([0,0,20])linear_extrude(height = height, center = true, convexity = 10) import (file = dxf);
    gridfinityInit(BoxLengthUnits, BoxWidthUnits, 200, 0, theanswer) {}
  
}
}

module toolDXF(
  dxf="dupontcrimp.dxf",
  BoxLengthUnits=2,
  BoxWidthUnits=5,
  height7=3)
{
  translate([0,0,topadjust])
    top(dxf,BoxLengthUnits,BoxWidthUnits,height7);
  bottom(BoxLengthUnits,BoxWidthUnits,height7);
}


toolDXF("rj45.dxf",2,5,3);

//boxfill("pliers.dxf");
