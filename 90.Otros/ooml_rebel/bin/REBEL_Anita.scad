/*

---------------------------------------------------------------------------------------------------
\\\\\\\\\\\\     Made in Anita  -  PilotoRebelde (Rogue squadron)    /////////////
---------------------------------------------------------------------------------------------------

*/




difference(){

	cylinder (h = 10, r=50, center = true);


	translate([0,18,0])

	cylinder (h = 15, r=35, center = true);

}


difference(){
	
	translate([0,-5,0])
	cube([70,30,10], center=true);

	#translate([-20,10,0])
	rotate([0,0,-60])
	color([0,0,1])
	scale([0.8,0.6,1])
	cylinder (h = 15, r=22, center = true);


	#rotate([0,180,0])
	translate([-20,10,0])
	rotate([0,0,-60])
	color([0,0,1])
	scale([0.8,0.6,1])
	cylinder (h = 15, r=22, center = true);

}

difference(){

	translate([0,18,0])
	rotate([0,0,45])
	cube([20,20,10], center=true);
	
	#rotate([0,0,-20])
	scale([0.5,0.5,0.5])
	difference(){

		translate([15,40,0])
		color([0,0,1])
	
		cylinder (h = 25, r=22, center = true);

		translate([15,30,0])
		color([0,0,1])
	
		cylinder (h = 35, r=22, center = true);
	}

	#
	rotate([0,180,0])
	rotate([0,0,-20])
	scale([0.5,0.5,0.5])
	difference(){

		translate([15,40,0])
		color([0,0,1])
	
		cylinder (h = 25, r=22, center = true);

		translate([15,30,0])
		color([0,0,1])
	
		cylinder (h = 35, r=22, center = true);

	}

}
