use <tooltracedxf.scad>

module mytrim(dxf)
{
  cutheight=100;
  difference()
  {
    linear_extrude(height = cutheight, center = true, convexity = 10)
      import (file = dxf);
    cube([2*42-2,5*42-2,cutheight],center=true);
  }
}

module testDXF(dxf="dupontcrimp.dxf")
{
  difference() {
    linear_extrude(height = 0.6, center = true, convexity = 10)
      import (file = dxf);
    mytrim(dxf);
  }
}

testDXF(dxf="rj45.dxf");
