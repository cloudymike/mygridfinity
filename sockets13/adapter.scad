use <../gridfinity-rebuilt-openscad/gridfinity-rebuilt-bins.scad>


module socketAdapter(
  label="", 
  label2="",
  BoxLengthUnits=2,
  BoxWidthUnits=1)
{
    $fn=120;
    textsize = 5; //Smaller requires high res printing
    OverExtrusion = 0.2;
    theanswer=42;
    height7=3;
    height = height7*7;
    intervalX = 38;
    intervalY = 33;
    diameter=19.85+2*OverExtrusion;
    cylinderHeight=theanswer-8;
    
    BoxUnits=42;
    StyleHole=0; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit, 4: Gridfinity Refined hole - no glue needed]
    WallAdjust = 1;
    WallAdjustY = -1;
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
      shaftD=13;
      socketD=18;
      shaftL=75;
      socketL=18;
      translate([shaftL/2-socketL/2,9,height/2+1+socketD/2]) rotate([90,0,90]) cylinder(d=socketD,h=socketL,center=true);
      translate([0,9,height/2+3+shaftD/2]) rotate([90,0,90]) cylinder(d=shaftD,h=shaftL,center=true);

      translate([-4.5-socketL/2,-9,height/2+2+socketD/2]) rotate([90,0,90]) cylinder(d=socketD,h=socketL,center=true);
      translate([0,-9,height/2+3+shaftD/2]) rotate([90,0,90]) cylinder(d=8,h=9,center=true);
  }
  labelHeight=textsize;
  labelThickness=2;
  labelFont="Liberation Sans";
    translate([-17-(BoxLengthUnits-1)*21,19-textsize+(BoxWidthUnits-1)*theanswer/2,height])
        linear_extrude(height = labelThickness)
            text(label, size=labelHeight, font=labelFont, halign="left", valign="center", spacing=1.1);
    translate([-17-(BoxLengthUnits-1)*21,19-2.3*textsize+(BoxWidthUnits-1)*theanswer/2,height])
        linear_extrude(height = labelThickness)
            text(label2, size=labelHeight, font=labelFont, halign="left", valign="center", spacing=1.1);

}

socketAdapter();