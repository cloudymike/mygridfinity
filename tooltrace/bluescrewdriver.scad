/*  
This takes a large stl file and cuts the Y dimension in half. A boolen variable "front" tells if the front or back half should be rendered. A little offset from center is required to make sure the dovetail is not in the middle of the border between unit blocks.
This is tested with a 6 unit length split in to two pieces of 3 units. 
*/
use <../OpenSCAD_Dovetail/dovetail.scad>;

/* [Teeth] */

// Teeth count
Teeth_count = 5; // [2:10]

// Teeth height
Teeth_height = 8; // [2:20]

// Teeth clearance
Teeth_clearance = 4; // [1:10]

/* [General] */

// Displayed element choice
Debug_flag = false; // [true:Active, false:Unactive]

// Cube dimension
Cube_dimension = [2*42, 6*42, 50];

/**
 * [x, y, z]
 * - x : Teeth count
 * - y : Teeth height
 * - z : Teeth Clearance
 */
teeth = [Teeth_count, Teeth_height, Teeth_clearance / 10];

module stlwithbits()
{
    difference()
    {
        height=20;
        diameter=7.8;
        import("bluescrewdriver.STL");
        translate([22,115,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
        translate([-22,115,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);

        translate([22,100,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
        translate([-22,100,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);

        translate([22,85,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
        translate([-22,85,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);

        translate([22,70,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
        translate([-22,70,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);

        translate([22,55,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
        translate([-22,55,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);

        translate([22,40,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
        translate([-22,40,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);

        translate([22,25,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);
        translate([-22,25,height/2+2]) cylinder(d=diameter,h=height+2,center=true, $fn=6);

    }
}

module cutTooltrace(front=true) {

if (front) 
  intersection() {stlwithbits();cutter([0, 10, 0], Cube_dimension, teeth, false, Debug_flag);}
else
  intersection() {stlwithbits();cutter([0, 10, 0], Cube_dimension, teeth, true, Debug_flag);}
}

cutTooltrace(front=true);

// Uncomment for 2d for outline print
//projection(cut=true) translate([0, 0, -10])
//stlwithbits();
