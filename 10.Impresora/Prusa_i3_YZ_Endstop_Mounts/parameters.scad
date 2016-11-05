//
// common.scad
//

$fn = 24;

radius_3mm = 1.7;
radius_4mm = 2.2;
diam_8mm = 8;
radius_8mm = diam_8mm / 2;

// tunables

part_thickness = 2.3; // see how it slices

// stats about your i3
rod_frame_gap = 24.8;
frame_thickness = 6.8;

// distance between lower and upper y bars
y_bars_gap = 16;

// size of the endstop
endstop_w = 20 + 0.2;
endstop_h = 10.5 + 0.2;
endstop_d = 6 + 0.2 + 0.2;

// useful shorthand
pt2 = part_thickness / 2;
