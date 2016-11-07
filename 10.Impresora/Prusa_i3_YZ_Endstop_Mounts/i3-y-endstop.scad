//
// i3-y-endstop.scad
//

include <common.scad>

y_bar_dist = y_bars_gap + radius_8mm * 2;

module y_carriage_rods() {
	color([0.9,0.9,0.9])
		rotate([90,0,0]) {
			cylinder(r=radius_8mm, h=100, center=true);
			translate([0,y_bar_dist,0]) cylinder(r=radius_8mm, h=100, center=true);
		}
}

module rod_clip() {
	clip_r = radius_8mm + part_thickness;
	clip_h = endstop_h + part_thickness;
	difference() {
		cylinder(r=clip_r, h=clip_h);
		translate([0,0,clip_h/2]) cylinder(r=radius_8mm, h=clip_h + 1, center=true);
		translate([radius_8mm + 1, 3, clip_h / 2]) cube([4, 8, clip_h+1], center=true);
		translate([0,radius_8mm,clip_h / 2]) cube([diam_8mm,diam_8mm,clip_h+1], center=true);
	}
}

module i3_y_endstop() {
	union() {

		rod_clip();
		translate([0,y_bar_dist,clip_h])
			rotate([180,0,0])
				rod_clip();

		translate([-radius_8mm - pt2, y_bar_dist / 2, clip_h / 2])
			cube([part_thickness, y_bar_dist, clip_h], center=true);

		translate([-holder_d / 2 - radius_8mm,part_thickness+y_bars_gap-14,0])
			endstop_holder();

	} // union
}

// y_carriage_rods();

i3_y_endstop();
