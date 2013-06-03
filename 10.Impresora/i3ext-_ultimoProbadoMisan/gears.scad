
include <gear_script.scad>;

module big_gear() {
	difference() {
		translate ([0,0,0])
			gear(number_of_teeth=26,
				 circular_pitch=300,
				 rim_thickness=5,
				 bore_diameter=6.2
				 );
		translate ([0,0,6]) cylinder(r=10.2/2, h=5, $fn=6);
	}
}


module small_gear() {
	translate([29,0,0]) {
		difference(){
			rotate([0,0,360*-1/10]) 
				gear(number_of_teeth=9,
					 circular_pitch=300,
					 rim_thickness=15,
					 hub_thickness=17,
					 hub_diameter=18.5,
					 gear_thickness=8,
					 bore_diameter=6.4
					 );
			translate([-3.25,3.75,9]) cube([6.5,3.2,9]);
			translate([0,0,9+3.5]) rotate([-90,0,0]) 
				cylinder(r=1.75, h=20, $fn=10);
		}
	}
}


big_gear();
small_gear();