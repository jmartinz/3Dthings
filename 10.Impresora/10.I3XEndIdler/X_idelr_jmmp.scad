difference(){
union(){
	import("Code_Xend_Idler_A.stl");
	translate([-38.5,0,30])rotate([0,90,0])color("green")difference(){
		cylinder(h=7, r=3, center=true);
		cylinder(h=10,r=1.5, center=true);
	}
}

color("red")translate([-43,0,25])cube([6,20,30],center=true);
}


