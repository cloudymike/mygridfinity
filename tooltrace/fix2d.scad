// Create some padding if required
// to the DXF file
// Should be based on parameters from file but
// can not figure out how to extract it
//
// When rendered, export as a new DXF file and use for tooltrace


module 2dfix(dxf="moisturemeter.dxf")
{
  import(dxf);
  translate([0,100])square([96,20],center=true);
  translate([0,-100])square([96,20],center=true);
}


2dfix(dxf="moisturemeter.dxf");