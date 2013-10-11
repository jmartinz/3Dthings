//-- captive Nuts
nut_h = 2.6;//1.6;//2.6;
nut_radius = 6.4/2;
hole_d = 3.2;    // Diameter of center hole


difference(){
	union(){
	
		import("Code_Xend_Idler_B_623.stl");
		color("green")translate([85,90,37])cylinder(h=6, r=3, center=true);
	}

	translate([85,90,37.7])cylinder(h=7,r=hole_d/2, center=true);
	translate([85,90,35.5])color("red")cylinder(r=nut_radius, h=nut_h,$fn=6, center=true);

	
}

