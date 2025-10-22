use <../gridfinity-rebuilt-openscad/gridfinity-rebuilt-bins.scad>

// M screw holder
// Tries to pack as many as possible based on tile size
// Does not try to make it symmetric


module straightWallBin( 
  BoxLengthUnits=1,
  BoxWidthUnits=1,
  divx=1 )
{
  textsize = 5; //Smaller requires high res printing
  $fn=120;
  OverExtrusion = 0.2;
  theanswer=42;
  height7=4;
  height = height7*7;
  interval = 16.5;
  diameter=14.2+2*OverExtrusion;
  
  /* [Linear Compartments] */
  // number of X Divisions (set to zero to have solid bin)
  //divx = 1;
  // number of Y Divisions (set to zero to have solid bin)
  divy = 1;
  
  /* [Features] */
  // the type of tabs
  style_tab = 5; //[0:Full,1:Auto,2:Left,3:Center,4:Right,5:None]
  // how should the top lip act
  style_lip = 2; //[0: Regular lip, 1:remove lip subtractively, 2: remove lip and retain height]
  // scoop weight percentage. 0 disables scoop, 1 is regular scoop. Any real number will scale the scoop.
  scoop = 0; //[0:0.1:1]
  
  BoxUnits=42;
  //BoxWidthUnits=1;
  StyleHole=0; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit, 4: Gridfinity Refined hole - no glue needed]
  WallAdjust = 2;
  union () {
    gridfinityInit(BoxLengthUnits, BoxWidthUnits, height(height7), 0, theanswer) {
      cutEqual(n_divx = divx, n_divy = divy, style_tab = style_tab, scoop_weight = scoop);
    }
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

straightWallBin(BoxLengthUnits=2, BoxWidthUnits=1, divx=1);
