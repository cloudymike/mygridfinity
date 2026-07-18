/*
  Standalone 2x1 Gridfinity holder
  - Grid: 42 x 42 mm
  - Overall height: 30 mm
  - Six cylindrical pockets: Ø17 mm
  - Pocket spacing: 4 mm edge-to-edge
  - Pocket floor: 1.2 mm above Gridfinity base
  - No magnet or screw holes
  
  PROMPT:
Create a standalone OpenSCAD model of a Gridfinity holder, using gridfinity squares 42 × 42 mm.
The design should be 30 mm tall.
Use a true Gridfinity base socket based on block_base_solid() from
gridfinity-rebuilt-openscad. 
Add a 6 cylindrical pocket, 17 mm in diameter,
open at the top, with a 1.2 mm floor above the Gridfinity base. 
Use the minimum amount of Gridfinity squares to allow the 6 pockets have 4 mm between each pocket.
No magnet or screw holes. 
Output only the .scad file.

*/

$fn = 96;

// Main dimensions
grid = 42;
grid_x = 2;
grid_y = 1;
overall_height = 30;
clearance = 0.5;

// Gridfinity base dimensions, matching the profile used by
// block_base_solid() in gridfinity-rebuilt-openscad.
h_base = 5.0;
h_bottom_step = 2.2;
r_c1 = 0.8;
r_c2 = 2.15;
r_outer_bottom = 3.75;
r_outer_middle = 1.6;
r_outer_top = 0.8;

// Pocket dimensions
pocket_diameter = 17;
pocket_gap = 4;
pocket_pitch = pocket_diameter + pocket_gap;
floor_thickness = 1.2;
pocket_bottom_z = h_base + floor_thickness;

footprint_x = grid_x * grid - clearance;
footprint_y = grid_y * grid - clearance;

module rounded_rectangle(length, width, height, radius) {
    linear_extrude(height)
        offset(r = radius)
            offset(delta = -radius)
                square([length, width], center = true);
}

// Standalone equivalent of block_base_solid() without holes.
module gridfinity_base_socket_cell() {
    cell_x = grid - 0.05;
    cell_y = grid - 0.05;

    translate([0, 0, h_base])
        mirror([0, 0, 1])
            union() {
                hull() {
                    rounded_rectangle(
                        cell_x - 2*r_c2 - 2*r_c1,
                        cell_y - 2*r_c2 - 2*r_c1,
                        h_base,
                        r_outer_top
                    );
                    rounded_rectangle(
                        cell_x - 2*r_c2,
                        cell_y - 2*r_c2,
                        h_base - r_c1,
                        r_outer_middle
                    );
                }

                hull() {
                    rounded_rectangle(
                        cell_x - 2*r_c2,
                        cell_y - 2*r_c2,
                        r_c2,
                        r_outer_middle
                    );
                    mirror([0, 0, 1])
                        rounded_rectangle(
                            cell_x,
                            cell_y,
                            h_bottom_step / 2,
                            r_outer_bottom
                        );
                }
            }
}

module gridfinity_base() {
    for (ix = [0:grid_x-1])
        for (iy = [0:grid_y-1])
            translate([
                (ix - (grid_x-1)/2) * grid,
                (iy - (grid_y-1)/2) * grid,
                0
            ])
                gridfinity_base_socket_cell();
}

module holder_solid() {
    union() {
        gridfinity_base();

        translate([0, 0, h_base])
            rounded_rectangle(
                footprint_x,
                footprint_y,
                overall_height - h_base,
                4
            );
    }
}

module pocket_cutters() {
    for (row = [-0.5, 0.5])
        for (column = [-1, 0, 1])
            translate([
                column * pocket_pitch,
                row * pocket_pitch,
                pocket_bottom_z
            ])
                cylinder(
                    d = pocket_diameter,
                    h = overall_height - pocket_bottom_z + 0.1
                );
}

difference() {
    holder_solid();
    pocket_cutters();
}
