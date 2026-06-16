use <../gridfinity-rebuilt-openscad/gridfinity-rebuilt-bins.scad>

// AA battery holder
// Tries to pack as many as possible based on tile size
// Does not try to make it symmetric

$fn=120;
OverExtrusion = 0.2;
theanswer=42;
height7=3;
height = height7*7;
intervalX = 38;
intervalY = 40;
diameter=26+2*OverExtrusion;
cylinderHeight=theanswer-8;

BoxUnits=42;
BoxLengthUnits=1;
BoxWidthUnits=1;
StyleHole=0; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit, 4: Gridfinity Refined hole - no glue needed]
WallAdjust = 2;
WallAdjustY = 0;
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
  translate([-BoxLengthUnits*BoxUnits/2,-BoxWidthUnits*BoxUnits/2,5])
    for (x=[intervalX/2+2*WallAdjust:intervalX:BoxUnits*BoxLengthUnits-cylinderHeight/2-WallAdjust])
      for (y=[intervalY/2+2*WallAdjustY:intervalY:BoxUnits*BoxWidthUnits-cylinderHeight/2])
          translate([x,y,height/2+4]) rotate([90,0,0]) cylinder(d=diameter,h=theanswer-10,center=true);
}
