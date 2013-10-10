include <thumb_wheel_Xidler.scad>
nut_h = 2.6;
nut_radius = 6.4/2;
hole_d = 3.2;    // Diameter of center hole

module x_idlerA(){difference(){
union(){
	import("Code_Xend_Idler_A.stl");
	translate([-38.5,0,30])rotate([0,90,0])difference(){
		cylinder(h=7, r=3, center=true);
		cylinder(h=10,r=1.5, center=true);
	}
}

translate([-43,0,25])cube([6,20,30],center=true);
}
}






module x_idlerB(){
difference(){
	union(){
	
		import("Code_Xend_Idler_B_623.stl");
		translate([85,90,37])cylinder(h=6, r=3, center=true);
	}

	translate([85,90,37])cylinder(h=10,r=hole_d/2, center=true);
	translate([85,90,35])difference(){	
		cylinder(r=nut_radius, h=nut_h,$fn=6, center=true);
		cylinder(h=10,r=hole_d/2, center=true);
	}
	
}
}


module tornhexM3(len)
{
	e=5.4;
	h1=2.15;
	cylinder(r=3/2,h=len);
	translate([0,0,-h1]) cylinder(r=e/2,h=h1,$fn=6);
}

x_idlerA();


translate([-75,0,30])rotate([90,0,0])translate([85,-90,-85])rotate([0,-90,0])union(){
	x_idlerB();
	translate([85,90,35])color("grey")tornhexM3(30);
	color("blue")translate([85,90,52])twX();
}