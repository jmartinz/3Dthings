//main body
module PSC12V(){
difference() {
	union() {
		cube([56,121,3]); //bottom
		cube([56,3,75]);  //y0
		cube([3,120,45]);  //x0
		translate([0,119,0]) cube([56,3,75]); //yn
		translate([53,0,0]) cube([3,120,65]); //xn
		cube([3,6,75]); //x0y0 lip
		translate([53,0,0]) cube([3,6,75]); //yn lip
		translate([0,115,0]) cube([3,6,75]); //y0 lip
		translate([53,115,0]) cube([3,6,75]); //xnyn lip
		translate([44,14,3]) cube([4,28,10]); //cable securing block
	}
	translate([39,23,0]) cube([5,10,5]); //cable hole
	translate([4,80,0]) cube([47,27,3]); //power switch hole
	translate([9,107,1]) cube([12,1,2]); // botom left notch for power switch
	translate([9,79,1]) cube([12,1,2]); //bottom right notch for power switch
	translate([35,107,1]) cube([12,1,2]); //top left notch for power switch
	translate([35,79,1]) cube([12,1,2]); //top right notch for power switch
	translate([15,-1,72]) rotate([270,0,0]) cylinder(h=400, r=1.5, $fn=50); // screw holes x0, xn bottom.  Attach to power supply
	translate([47,-1,72]) rotate([270,0,0]) cylinder(h=400, r=1.5, $fn=50); // screw holes x0, nx top.  Attach to power supply
	translate([43,19.5,8]) rotate([0,90,0]) cylinder(h=6, r=1.5, $fn=50); // x0 side screw hole for cable securing block
	translate([43,36.5,8]) rotate([0,90,0]) cylinder(h=6, r=1.5, $fn=50);// xn side screw hole for cable securing block
	translate([51,19.5,8]) rotate([0,90,0]) cylinder(h=5, r=3, $fn=50); //x0 side access hole for cable securing block
	translate([51,36.5,8]) rotate([0,90,0]) cylinder(h=5, r=3, $fn=50); //xn side access hole for the cable securing block
}

//cable securing block bracket
difference() {
	union() {
		translate([12,89,0]) cube([28,10,3]); //main body
		translate([17.5,94,3]) cube([5.75,10,2], center=true); //y0 part of captave nut
		translate([17.5,94,3]) rotate(a=[0,0,60]) cube([5.75,10,2], center=true); //y0 part of captave nut
		translate([17.5,94,3]) rotate(a=[0,0,120]) cube([5.75,10,2], center=true); // y0 part of captave nut
		translate([34.5,94,3]) cube([5.75,10,2], center=true); //yn part of captive nut
		translate([34.5,94,3]) rotate(a=[0,0,60]) cube([5.75,10,2], center=true); //yn part of captive nut
		translate([34.5,94,3]) rotate(a=[0,0,120]) cube([5.75,10,2], center=true); //yn part of captive nut
	}
	translate([17.5,94,0]) cylinder(h=10, r=1.5, $fn=50); //y0 screw hole
	translate([34.5,94,0]) cylinder(h=10, r=1.5, $fn=50); //yn screw hole
	translate([17.5,94,3]) cube([3.5,6,2], center=true); //y0 part of captive nut
	translate([17.5,94,3]) rotate(a=[0,0,60]) cube([3.5,6,2], center=true); //y0 part of captive nut
	translate([17.5,94,3]) rotate(a=[0,0,120]) cube([3.5,6,2], center=true); //y0 part of captive nut
	translate([34.5,94,3]) cube([3.5,6,2], center=true); //yn part of captive nut
	translate([34.5,94,3]) rotate(a=[0,0,60]) cube([3.5,6,2], center=true); //yn part of captive nut
	translate([34.5,94,3]) rotate(a=[0,0,120]) cube([3.5,6,2], center=true); //yn part of captive nut
}
}
PSC12V();
color("red")bracket();
//cable securing block bracket
module bracket(){
difference() {
	union() {
		translate([12,89,0]) cube([28,10,3]); //main body
		translate([17.5,94,3]) cube([5.75,10,2], center=true); //y0 part of captave nut
		translate([17.5,94,3]) rotate(a=[0,0,60]) cube([5.75,10,2], center=true); //y0 part of captave nut
		translate([17.5,94,3]) rotate(a=[0,0,120]) cube([5.75,10,2], center=true); // y0 part of captave nut
		translate([34.5,94,3]) cube([5.75,10,2], center=true); //yn part of captive nut
		translate([34.5,94,3]) rotate(a=[0,0,60]) cube([5.75,10,2], center=true); //yn part of captive nut
		translate([34.5,94,3]) rotate(a=[0,0,120]) cube([5.75,10,2], center=true); //yn part of captive nut
	}
	translate([17.5,94,0]) cylinder(h=10, r=1.5, $fn=50); //y0 screw hole
	translate([34.5,94,0]) cylinder(h=10, r=1.5, $fn=50); //yn screw hole
	translate([17.5,94,3]) cube([3.5,6,2], center=true); //y0 part of captive nut
	translate([17.5,94,3]) rotate(a=[0,0,60]) cube([3.5,6,2], center=true); //y0 part of captive nut
	translate([17.5,94,3]) rotate(a=[0,0,120]) cube([3.5,6,2], center=true); //y0 part of captive nut
	translate([34.5,94,3]) cube([3.5,6,2], center=true); //yn part of captive nut
	translate([34.5,94,3]) rotate(a=[0,0,60]) cube([3.5,6,2], center=true); //yn part of captive nut
	translate([34.5,94,3]) rotate(a=[0,0,120]) cube([3.5,6,2], center=true); //yn part of captive nut
}
}