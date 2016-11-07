

module core(deg){
color("red")
rotate([0,0,deg])
translate([0,0,160/2+2]) 
cube(size = [11,1.8,160], center = true);
}

module portacub(){
	translate([0,0,48/2])
	difference(){
		cube(size = [30,18,56], center = true);
		translate([0,-2,0])cube(size = [26,18,52], center = true);
		cylinder(h = 150, r=4);
	}
}


module tapa(){

	cube(size = [30,2,56], center = true);
	difference(){
		translate([0,-2,0])cube(size = [26,3,52], center = true);
		cube(size = [24,18,50], center = true);

	}
}

module cil_vairlla(){
difference(){
 	union(){
		translate([0,0,47.8])cylinder(h = 150-48, r=7);
		porta9V();
	}
	for ( dg = [0 : 360/8 : 360] )
	{
 		core(dg);
	}
	color("green")translate([0,0,3])cylinder(h = 150, r=3);

}
}


module varilla(){
difference(){
 	union(){
		cylinder(h = 130, r=7);

	}
	translate([0,0,-3])for ( dg = [0 : 360/8 : 360] )
	{
 		core(dg);
	}
	color("green")translate([0,0,-3])cylinder(h = 150, r=3);

}
}

//cil_vairlla();
//varilla();
module porta9V(){
	portacub();
	color("red")difference(){
		translate([0,0,57.5])cube(size = [18,18,12], center = true);
		cylinder(h = 130, r=7);
	}
}
//rotate([-90,0,0])porta9V();
rotate([-90,0,0])tapa();


