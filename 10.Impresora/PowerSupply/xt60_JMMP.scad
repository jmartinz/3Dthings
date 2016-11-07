module xt60(){
	difference(){
		color("red")cube([26,15,15]);
		translate([5,3,-5])cube([13,8.3,80]);
		translate([18,3,-5])rotate([0,0,45])cube([6,6,80]);
		translate([11,4,5])rotate([90,0,0])cylinder(h = 10, r=1, $fn=60);
	}

}





