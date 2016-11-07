module powerSocket() {
	translate([20,0,-5]) cylinder(r=1.7, h=22, center=true);
	translate([-20,0,-5]) cylinder(r=1.7, h=22, center=true);
	hull() {
		minkowski() {
			cube([20.5,12.5,3], center=true);
			cylinder(r=5,h=0.1);
		}
		translate([20,0,0]) cylinder(r=5, h=3, center=true);
		translate([-20,0,0]) cylinder(r=5, h=3, center=true);
	}
	translate([0,0,-5.5 - 1.5])
		minkowski() {
			cube([20,12,11], center=true);
			cylinder(r=4,h=0.1);
		}
}

