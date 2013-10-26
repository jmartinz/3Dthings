// Variables //
wall_length = 10;
wall_height = 7;
wall_thickness = 1;

// Calculated Variables //
tower_height = wall_height + wall_height/3;
tower_radius = wall_thickness*2;
parapet_height = wall_thickness/4;

// A single Tower as a reusable module //
module tower(){
	difference(){
		difference(){
			cylinder(
				tower_height,
				tower_radius,
				tower_radius,
				$fn=35); //Main Tower

			translate([
				0,
				0,
				tower_height - parapet_height
			])
			cylinder(
				parapet_height +1,
				wall_thickness/1.5,
				wall_thickness/1.5,
				$fn=35); // Hole in top of tower
		}
	
	}
}

// Objects //

difference() {
	// Main Walls //
	difference() {
		cube([
				wall_length,
				wall_length,
				wall_height]);
			translate([
				wall_thickness,
				wall_thickness,
				-wall_thickness
			])
			cube([
				wall_length - wall_thickness*2,
				wall_length - wall_thickness*2,
				wall_length + wall_thickness*2
			]);
	}

// The Main Door //
	translate([
		wall_length/4,
		-1,
		-.01
	])
	cube([
		wall_length/2,
		wall_thickness+2,
		wall_height/2
	]);
}

// Towers //
translate([
	wall_thickness/4,
	wall_thickness/4,
	0
]) tower();

translate([
	wall_length - wall_thickness/4,
	wall_thickness/4,
	0
	]) tower();

translate([
	wall_thickness/4,
	wall_length - wall_thickness/4,
	0]) tower();

translate([
	wall_length - wall_thickness/4,
	wall_length - wall_thickness/4,
	0]) tower();