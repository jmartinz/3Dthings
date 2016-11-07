
module colgador(){
	difference(){
		colgadorMacizo();
		translate([10-80/2,0,10/2+15])colgadorAgujeros();
	}
}

module colgadorMacizo(){
	cube([80,25,10],center=true);
	color("green")translate([80/2+8.5/2,0,8/2])cube([8.5,25,18],center=true);

	color("red")translate([(10-80)/2,0,(61+10)/2])	
		cube([10,25,61],center=true);	

	translate([10+(15-80-1)/2,0,(15+10)/2-0.5])
	difference(){
		cube([15,25,15],center = true);
		translate([8,50,8])rotate([90,0,0])cylinder(r=15,h=100,$fn=60);
	}
}

module colgadorAgujeros(){
	agujeroTornillo();
	translate([0,0,30])agujeroTornillo();

}

module agujeroTornillo(){
	rotate([0,-90,0])cylinder(r=5.2/2, h=20, $fn=20);
	rotate([0,-90,0])cylinder(r2=5.2/2,r1=10/2, h=10.2/2, $fn=20);
	translate([-0.5,0,0])rotate([0,90,0])cylinder(r=10/2, h=20, $fn=20);
}

translate([0,0,25/2])rotate([90,0,0])colgador();

//colgador();



