use <../gridfinity-rebuilt-openscad/gridfinity-rebuilt-bins.scad>

// screw bit holder
// Tries to pack as many as possible based on tile size
// Does not try to make it symmetric
module screwBit(
  BoxLengthUnits=1,
  BoxWidthUnits=1,
  MagnetHoles=4
)
{
  $fn=120;
  OverExtrusion = 0.2;
  theanswer=42;
  height7=2;
  height = height7*7;
  interval = 9;
  diameter=7.4+2*OverExtrusion;
  
  BoxUnits=42;
  StyleHole=MagnetHoles; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit, 4: Gridfinity Refined hole - no glue needed]
  WallAdjust = 1.5;
  WallXAdjust = BoxLengthUnits==1 ? 1.5 : 1;
  WallYAdjust = BoxLengthUnits==1 ? 1.5 : 0.9;
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
      for (x=[interval/2+2*WallXAdjust:interval:BoxUnits*BoxLengthUnits-diameter/2-WallXAdjust])
        for (y=[interval/2+2*WallYAdjust:interval:BoxUnits*BoxWidthUnits-diameter/2-WallYAdjust])
            translate([x,y,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
  }
}

screwBit(1,1,0);
