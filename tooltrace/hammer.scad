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
Cube_dimension = [3*42, 7*42, 80];

/**
 * [x, y, z]
 * - x : Teeth count
 * - y : Teeth height
 * - z : Teeth Clearance
 */
teeth = [Teeth_count, Teeth_height, Teeth_clearance / 10];

module cutTooltrace(stl="testcube.stl", front=true) {

if (front) 
  intersection() {import(stl);cutter([0, 10, 0], Cube_dimension, teeth, false, Debug_flag);}
else
  intersection() {import(stl);cutter([0, 10, 0], Cube_dimension, teeth, true, Debug_flag);}
}

cutTooltrace(stl="hammer.STL",front=true);

//import("hammer.STL");