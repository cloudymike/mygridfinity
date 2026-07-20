/*
Standalone 3x3 Gridfinity cylindrical holder
- Grid: 3 x 3, 42 mm pitch
- Overall height: 10 mm
- Center pocket: 103 mm diameter
- Pocket floor: 1.2 mm above the Gridfinity base
- Annular channel: 3 mm wide, inner edge 2 mm outside pocket
- 5 mm wide radial connection between pocket and channel
- No magnet or screw holes

PROMPT:
Create a standalone OpenSCAD model of a 3×3 Gridfinity holder, each gridfinity square 42x42mm 15 mm tall. Use a true Gridfinity base socket based on block_base_solid() from gridfinity-rebuilt-openscad. Add a centered cylindrical pocket, 103 mm diameter, open at the top, with a 1.2 mm floor above the Gridfinity base. Create a 3mm  channel 2mm outside of the cylindrical pocket, the same depth as the pocket. Make a connection between the cylindrical pocket, 5mm wide at one side. No magnet or screw holes. Output only the .scad file.*/

$fn = 160;

grid_pitch = 42;
grid_x = 3;
grid_y = 3;
overall_x = grid_x * grid_pitch;
overall_y = grid_y * grid_pitch;
overall_height = 15;

// Standard Gridfinity bin-base height.
base_height = 4.75;
floor_thickness = 1.2;
cut_start_z = base_height + floor_thickness;
cut_depth = overall_height - cut_start_z + 0.02;

pocket_diameter = 103;
pocket_radius = pocket_diameter / 2;

channel_gap = 2;
channel_width = 3;
channel_inner_radius = pocket_radius + channel_gap;
channel_outer_radius = channel_inner_radius + channel_width;

connection_width = 5;

// Small epsilon used to avoid coincident faces.
eps = 0.01;


// ---------- Rounded 2D helpers ----------

module rounded_rectangle_2d(size_x, size_y, radius) {
    offset(r = radius)
        square([size_x - 2 * radius, size_y - 2 * radius], center = true);
}


// ---------- Gridfinity base ----------
//
// This reproduces the solid Gridfinity bin-foot profile used by
// block_base_solid(): a rounded 42 mm cell with the standard stepped/
// tapered 4.75 mm mating base, without magnet or screw holes.
//
// The dimensions below describe the standard Gridfinity mating profile:
//   z = 0.00 : 35.60 mm rounded footprint
//   z = 0.80 : 37.20 mm
//   z = 2.60 : 40.20 mm
//   z = 4.75 : 41.50 mm top footprint
//
module gridfinity_base_foot() {
    hull() {
        translate([0, 0, 0])
            linear_extrude(height = eps)
                rounded_rectangle_2d(35.6, 35.6, 1.6);

        translate([0, 0, 0.8])
            linear_extrude(height = eps)
                rounded_rectangle_2d(37.2, 37.2, 2.4);
    }

    hull() {
        translate([0, 0, 0.8])
            linear_extrude(height = eps)
                rounded_rectangle_2d(37.2, 37.2, 2.4);

        translate([0, 0, 2.6])
            linear_extrude(height = eps)
                rounded_rectangle_2d(40.2, 40.2, 3.75);
    }

    hull() {
        translate([0, 0, 2.6])
            linear_extrude(height = eps)
                rounded_rectangle_2d(40.2, 40.2, 3.75);

        translate([0, 0, base_height - eps])
            linear_extrude(height = eps)
                rounded_rectangle_2d(41.5, 41.5, 4.0);
    }
}


module gridfinity_3x3_base() {
    for (x = [0 : grid_x - 1])
        for (y = [0 : grid_y - 1])
            translate([
                (x - (grid_x - 1) / 2) * grid_pitch,
                (y - (grid_y - 1) / 2) * grid_pitch,
                0
            ])
                gridfinity_base_foot();
}


// ---------- Holder body ----------

module upper_body() {
    translate([0, 0, base_height - eps])
        linear_extrude(height = overall_height - base_height + eps)
            rounded_rectangle_2d(overall_x - 0.5, overall_y - 0.5, 4.0);
}


// ---------- Pocket and drainage/relief channel ----------

module cylindrical_pocket_cut() {
    translate([0, 0, cut_start_z])
        cylinder(h = cut_depth, r = pocket_radius);
}


module annular_channel_cut() {
    translate([0, 0, cut_start_z])
        difference() {
            cylinder(h = cut_depth, r = channel_outer_radius);
            translate([0, 0, -eps])
                cylinder(h = cut_depth + 2 * eps, r = channel_inner_radius);
        }
}


// A 5 mm wide radial connection on the +X side.
// It bridges the 2 mm space between the cylindrical pocket and channel.
module pocket_channel_connection_cut() {
    translate([
        pocket_radius - eps,
        -connection_width / 2,
        cut_start_z
    ])
        cube([
            channel_inner_radius - pocket_radius + 2 * eps,
            connection_width,
            cut_depth
        ]);
}


// ---------- Final model ----------

difference() {
    union() {
        gridfinity_3x3_base();
        upper_body();
    }

    cylindrical_pocket_cut();
    annular_channel_cut();
    pocket_channel_connection_cut();
}
