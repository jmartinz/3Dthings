cube([75,25,8],center=true);
translate([75/2,0,8/2])cube([8.5,25,16],center=true);

color("red")translate([(8-75)/2,0,(61+8)/2])
difference(){
	cube([8,25,61],center=true);
	translate([-10,0,61/2-15])rotate([0,90,0])cylinder(r=5.2/2, h=200, $fn=20);
	translate([-10,0,-61/2+17])rotate([0,90,0])cylinder(r=5.2/2, h=200, $fn=20);
	translate([0,0,-61/2+17])rotate([0,90,0])cylinder(r1=5.2/2,r2=10/2, h=8.2/2, $fn=20);
	translate([0,0,61/2-15])rotate([0,90,0])cylinder(r1=5.2/2,r2=10/2, h=8.2/2, $fn=20);
}

translate([8+(13-75)/2,0,(13+8)/2])
difference(){
	cube([13,25,13],center=true);
	translate([13/2,0,13/2])rotate([0,45,0])cube([17,27,17],center=true);
}
