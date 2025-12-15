use <../gridfinity-rebuilt-openscad/gridfinity-rebuilt-bins.scad>

$fn=120;
OverExtrusion = 0.2;
theanswer=42;
height7=5;
height = height7*7;
interval = 16.5;
diameter=31+2*OverExtrusion;

BoxUnits=42;
BoxLengthUnits=1;
BoxWidthUnits=1;
StyleHole=0; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit, 4: Gridfinity Refined hole - no glue needed]
WallAdjust = 2;
difference () {
  union () {
    gridfinityInit(BoxLengthUnits, BoxWidthUnits, height(height7), 0, theanswer) {}
    gridfinityBase(
      gx=BoxLengthUnits, 
      gy=BoxWidthUnits, 
      l=theanswer, 
      dx=0, 
      dy=0, 
      style_hole=StyleHole 
    );
  }
  translate([0,0,5+height/2])
cylinder(d=diameter,h=height+2,center=true);
}
