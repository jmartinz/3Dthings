default_schrauben_abstand = 20;
default_schrauben_radius=1.77;
default_schrauben_hoehe=16;
default_schrauben_z = -1;
default_schrauben_elemente=66;

module schraube(x, y, z, radius, hoehe){	
	color("lightgreen")
		translate([x, y, z])
			cylinder(r=radius, h=hoehe, $fn=default_schrauben_elemente);
}

function schrauben_abstand(position) = position + default_schrauben_abstand;

module schrauben(x, y, z, r, h){
	schraube(x, y, z, r, h);
	schraube(x, schrauben_abstand(y), z, r, h);
}


// **********************************************
//                                  Enviroment
// **********************************************

module cam_cable(){
	color("white")
		cube([0.1,16,60]);
	
	color("brown")
			translate([-1.35, -1, 55])
			cube([2.7,18,6]);
}

module cam(){
	translate([-10, 0, 55])
	union() {
		color("green")
			translate([0, 0, 0])
			cube([1,25,25]);
		color("black")
			translate([0.9, 9, 7])
			cube([3,8,8]);
		
		translate([-1, 4.5, -55])
			cam_cable();
		}
}


// **********************************************
//                                  Objects
// **********************************************
$fn=60;
module cam_base() {
	color("lightgreen")
	difference() {
		union() {
			cube([15,25,11]);
			
			translate([7.5,10,18])
				rotate([-90,0,0])
					union() {
						cylinder(r=7.5,h=5, center=false);
						translate([-7.5,0,0])cube([15,10,5]);
					}
		}		
		hull() {
			schraube(7.5, 2.5, 7.5, 3.4, 5);
			schraube(7.5, 0, 7.5, 3.4, 5);
		}
		hull() {
			schraube(7.5, 22.5, 7.5, 3.4, 5);
			schraube(7.5, 25, 7.5, 3.4, 5);
		}
		hull() {
			schraube(7.5, 2.5, -4, default_schrauben_radius, 15);
			schraube(7.5, 0, -4, default_schrauben_radius, 15);
			
		}
		hull() {
			schraube(7.5, 22.5, -4, default_schrauben_radius, 15);
			schraube(7.5, 25, -4, default_schrauben_radius, 15);
		}
		rotate([90,0,0])
			schraube(7.5, 18.5, -20, default_schrauben_radius, 15);
	}
}

module cam_arm() {
	rotate([90,0,0])
		difference() {
			hull() {
				cylinder(r=5, h=5);
				translate([0,20,0])
					cylinder(r=5, h=5);
			}		
			schrauben(0,0,-2, default_schrauben_radius, 9);
			
			translate([0,0,-0.1])cylinder(r=3.5,h=2.6, $fn=6);
			translate([0,20,-0.1])cylinder(r=3.5,h=2.6, $fn=6);
		}
}

module cam_arm_handles() {
	translate([7.5,10,18.5])cam_arm();
	translate([7.5,20,18.5])cam_arm();	
	translate([7.5,15,38.5])cam_arm();
}


module cam_case_back() {
	translate([-15, 27, 55.5])
		rotate([180,-90,0])		
			union() {
				difference() {
					cube([28, 29, 7.8]);
					
					translate([-0.1, 2.5, 1.9])
						cube([26, 24, 6]);
						
					translate([-0.1,2.5,4.5])
						rotate([45,0,0])
							cube([26, 1.5, 1.5]);
							
					translate([-0.1,26.5,4.5])
						rotate([45,0,0])
							cube([26, 1.5, 1.5]);
							
					
				}
				translate([1,1.2,5.5])sphere(1);
				translate([1,27.8,5.5])sphere(1);
			}
}

module cam_case_front() {
	translate([-15,29,53.7])
		rotate([180,-90,0])
			union() {
				difference() {
					union() {
						cube([32, 33, 11]);
						
						
						
						translate([0,-5.0,0]) cube([9,5,11]);
							
					}
					rotate([90,0,0])schraube(4.8,5.5,-1.8,default_schrauben_radius, 10);
					rotate([90,90,0])translate([-5.5,4.8,-1.8])cylinder(r=3.45,h=2.6, $fn=6);
				
					difference() {
						translate([-0.1, 1.75, -0.1])
							cube([30.1, 29.5, 10]);
							
						translate([0,0,-1])cube([1.5,3.5,11]);
						translate([0,29.5,-1])cube([1.5,3.5,11]);
					}
							
					translate([12.5,16,8])
						cylinder(r=5, h=4);
				}
				
			}
}

module cam_case() {
	cam();
	cam_case_front();
	cam_case_back();
}


module cam_holder() {
	cam_base();
	color("lightblue")
		cam_arm_handles();
	translate([17,-24.5,0])cam_case();
}


// **********************************************
//                                  Built it
// **********************************************
// Layouts:
//
//  	cam_base
//
//		cam_arm
//		cam_arm_handles
//
//		cam_case_front
//		cam_case_back
//		cam_case
//		
//		dev
// 	
//**********************************************
Layout="cam_case";

if(Layout=="cam_base") {
	cam_base();
}

if(Layout=="cam_arm_handles") {
	cam_arm_handles();
}
if(Layout=="cam_arm") {
	cam_arm();
}

if(Layout=="cam_case") {
	cam_case();
}
if(Layout=="cam_case_front") {
	cam_case_front();
}
if(Layout=="cam_case_back") {
	cam_case_back();
}

if(Layout=="cam") {
	cam();
}

if(Layout=="dev") {
	cam_holder();
}