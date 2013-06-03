
include <gear_script.scad>;

module big_gear() {
	difference() {
		translate ([0,0,0])
			gear(number_of_teeth=20,
				 circular_pitch=345,
				 rim_thickness=5,
				 bore_diameter=6.2
			);
		translate ([0,0,6])
		cylinder(r=10.2/2, h=5, $fn=6);
	}
}

// kliment's original
module small_gear()
{
	translate([0,0,0])
	{

		translate ([29,0,0])
		rotate ([0,0,360*-1/20]) gear (number_of_teeth=10,
			circular_pitch=345,rim_thickness=10,hub_thickness=15,bore_diameter=5.4);
	}
}

// kliment's + nut trap and set screw
module small_gear2() {
	translate([29,0,0]) {
		difference() {
			rotate([0,0,360*-1/20]) 
				gear(number_of_teeth=10,
			  			circular_pitch=345,
			  			rim_thickness=10,
			  			hub_thickness=20.5,
			  			hub_diameter=18.5,
			  			gear_thickness=10,
			  			bore_diameter=6.4
			  );
			translate([-3.25,3.75,12]) cube([6.5,3.2,9]);
			translate([0,0,9+3.5+3]) rotate([-90,0,0]) 
				cylinder(r=1.75, h=20, $fn=10);
			}
		}
}

big_gear();
small_gear2();