//
// common.scad
//

include <parameters.scad>

clip_h = endstop_h + part_thickness;
holder_d = endstop_d + part_thickness * 2;
holder_w = endstop_w + part_thickness * 2;

module endstop_holder() {
	difference() {
		translate([-holder_d / 2, radius_8mm, 0])
			cube([holder_d, holder_w, clip_h]);

		translate([-holder_d / 2, radius_8mm, 0]) {
			// cutout endstop hole
			translate([part_thickness, part_thickness, part_thickness + 1]) cube([endstop_d, endstop_w, endstop_h + 2]);

			// cutout endstop wire hole
			translate([part_thickness + 1, part_thickness, -0.5]) cube([endstop_d - 2, endstop_w, part_thickness + 2]);
		}
		// cutout the rod
		cylinder(r=radius_8mm, h=clip_h + 1);
	}
}

module screw(r=radius_3mm, length=10, cap=2, hex=false) {
	cylinder(r=r, h=length);
	translate([0, 0, length])
		difference() {
			cylinder(r1=r+1, r2=r + 0.8, h=cap);
			translate([0, 0, cap]) {
				if (hex) {
					cylinder(r=r, h=2, $fn=6, center=true);
				}
				else {
					rotate([0, 0, 45])
						cube([r * 2, r / 4, 2], center=true);
					rotate([0, 0, 135])
						cube([r * 2, r / 4, 2], center=true);
				}
			}
		}
}
