difference() {
	union() {
		cube([27, 13, 5]);
		translate([27, 6.5, 0]) rotate([0, 0, 30]) cylinder(r = 6.5, h = 5, $fn = 6);
	}
	translate([27, 6.5, 0]) rotate([0, 0, 30]) {
		cylinder(r = 3.4, h = 2.4, $fn = 6);
		translate([0, 0, 2.6]) cylinder(r = 1.9, h = 2.4, $fn = 8);
	}
}
translate([17, 6.5, 5+7.5]) {
	rotate([90, 0, 90]) {
		difference() {
			union () {
				cylinder(r = 6.5, h = 4, $fn = 6);
				translate([-6.5, -12, 0]) cube([13, 12, 4]);
			}
			rotate([0, 0, 45]) cylinder(r = 2.5, h = 4, $fn = 4);
		}
	}
}