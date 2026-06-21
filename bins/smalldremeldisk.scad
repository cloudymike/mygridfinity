use <../gridfinity-rebuilt-openscad/gridfinity-rebuilt-bins.scad>


module smalldremeldisk(
  label="", 
  label2="",
  BoxLengthUnits=1,
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
      translate([-BoxLengthUnits*BoxUnits/2,-BoxWidthUnits*BoxUnits/2,5])
        for (x=[intervalX/2+2*WallAdjust:intervalX:BoxUnits*BoxLengthUnits-cylinderHeight/2-WallAdjust])
          for (y=[intervalY/2+2*WallAdjustY:intervalY:BoxUnits*BoxWidthUnits-cylinderHeight/2])
              translate([x,y,height/2+4]) rotate([90,0,90]) cylinder(d=diameter,h=theanswer-10,center=true);
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

smalldremeldisk(label="Grinding", label2="Metal");