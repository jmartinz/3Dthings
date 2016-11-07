
difference(){
	union(){
		cube([50,20,4]);
		cube([20,20,24]);
	}
	union(){
	translate([10,10,20]) cylinder(r1=2,35, r2=3, h=5);
	translate([10,10,4]) cylinder(r=2,36, h=16);
	translate([10,10,0]) cylinder(r1=1.1, r2=2,35, h=4);
	}
}