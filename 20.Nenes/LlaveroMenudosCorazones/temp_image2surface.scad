translate([0, 0, -1]) difference() {
	scale([0.11337868480725624, 0.11337868480725624, 1]) translate([0, 0, 1]) surface("temp_image2surface.dat", center=true, convexity=5);
	cube([150.0, 139.1156462585034, 2], center=true);
}