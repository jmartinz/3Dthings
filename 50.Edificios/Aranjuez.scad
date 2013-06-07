difference(){
	scale([0.000204661871842,0.000204661871842,0.000204661871842]) import("PalacioAranjuez.stl");

	union(){
		translate([70,0,0]) color("red")cube([150,150,10],center=true);
		translate([-20,-55,0]) color("blue")cube([150,150,7],center=true);
		translate([-90,60,0]) color("green")cube([90,90,7],center=true);
		translate([-50,100,0]) color("orange")cube([90,90,7],center=true);
	}
}