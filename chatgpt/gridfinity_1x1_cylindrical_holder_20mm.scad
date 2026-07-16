/*
Gridfinity 1x1 cylindrical holder
---------------------------------
Overall height: 20 mm
Grid footprint: 1 x 1
Pocket diameter: 28 mm

The bottom base geometry is a standalone adaptation of block_base_solid()
from kennetek/gridfinity-rebuilt-openscad, using the dimensions from the
referenced commit's standard.scad.

No external OpenSCAD libraries are required.
*/

$fn = 96;

// ---------- Holder dimensions ----------
overall_height = 20;
pocket_diameter = 28;
floor_thickness = 1.2;

// ---------- Gridfinity standard dimensions ----------
l_grid = 42;
bin_clearance = 0.5;
outer_size = l_grid - bin_clearance;   // 41.5 mm

h_base = 5;
h_bot = 2.2;

r_c1 = 0.8;      // lower base chamfer
r_c2 = 2.4;      // upper base chamfer

r_fo1 = 7.5 / 2; // 3.75 mm
r_fo2 = 3.2 / 2; // 1.60 mm
r_fo3 = 1.6 / 2; // 0.80 mm

epsilon = 0.01;

// Rounded rectangle matching the utility module's implementation.
module rounded_rectangle(length, width, height, radius) {
    linear_extrude(height)
        offset(radius)
            offset(-radius)
                square([length, width], center = true);
}

/*
Standalone Gridfinity base socket.

This follows the referenced block_base_solid() construction:
- full 41.5 mm profile at the top of the foot
- 2.4 mm upper transition
- 0.8 mm lower transition
- 5 mm total base height
*/
module gridfinity_base_solid() {
    xx = outer_size - 0.05;
    yy = outer_size - 0.05;

    translate([0, 0, h_base])
        mirror([0, 0, 1])
            union() {
                // Lower portion of the foot:
                // transition between the smallest and middle profiles.
                hull() {
                    rounded_rectangle(
                        xx - 2*r_c2 - 2*r_c1,
                        yy - 2*r_c2 - 2*r_c1,
                        h_base,
                        r_fo3
                    );

                    rounded_rectangle(
                        xx - 2*r_c2,
                        yy - 2*r_c2,
                        h_base - r_c1,
                        r_fo2
                    );
                }

                // Upper transition from the middle profile to the
                // full-width Gridfinity body.
                hull() {
                    rounded_rectangle(
                        xx - 2*r_c2,
                        yy - 2*r_c2,
                        r_c2,
                        r_fo2
                    );

                    mirror([0, 0, 1])
                        rounded_rectangle(
                            xx,
                            yy,
                            h_bot / 2,
                            r_fo1
                        );
                }
            }
}

// Solid body above the Gridfinity base.
// The 28 mm cylindrical pocket leaves a 1.2 mm floor above the base.
module holder_body() {
    pocket_bottom = h_base + floor_thickness;

    difference() {
        translate([0, 0, h_base - epsilon])
            rounded_rectangle(
                outer_size,
                outer_size,
                overall_height - h_base + epsilon,
                r_fo1
            );

        translate([0, 0, pocket_bottom])
            cylinder(
                d = pocket_diameter,
                h = overall_height - pocket_bottom + epsilon
            );
    }
}

union() {
    gridfinity_base_solid();
    holder_body();
}
