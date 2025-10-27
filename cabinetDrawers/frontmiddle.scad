use <../baseplates/thickbaseplatemodule.scad>
use <handle.scad>

  sizeX=178;
  sizeY=136;
  
  rowX=4;
  rowY=3;

  myThickPlate(4,3,0,136);
  
  translate([0,-sizeY/2,0])handle();
  
  
  