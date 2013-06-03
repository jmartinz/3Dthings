/*
bearing diameter 16mm
*/

hobb = 7; 				// use 6 if using Prusa's hobbed pulley
mount_spacing = 24; 	// use 30 if using the newer, 30mm hole x-carriage
jhead_mount = true; 	// set to false if using prusanozzle or stacking

// uncomment if printing
//rotate([0,0,-90]) translate([-45,7,0]) idler();
//rotate([0,0,0]) translate([45,-24,0]) idler();

use <jhead.scad>;		// http://www.thingiverse.com/thing:45379
use <mk7.scad>; 		// TrinityLabs hobbed pulley
use <idler.scad>;		// idler
use <gears.scad>;		// gears
use <nema17.scad>;		// NEMA17 stepper motor

// jhead mounting groove
module jhead() {
	%translate([2,0,12]) rotate([0,-90,0]) hotend_jhead(); 
	%translate([2,0,-13]) rotate([0,-90,0]) hotend_jhead(); 

	// jhead mount groove
	difference() {
		translate([-2,0,0]) cube(size=[9.5,24,52], center=true);
		cube(size=[5.6,16.5,52.1], center=true);
		translate([-4.8,0,0]) cube(size=[4.1,12.5,52.1], center=true);

		// M3 jhead clamping holes
		// front jhead hotend
		translate([-4.2,0,4.5]) rotate([90,90,0]) 
			cylinder(r=2, h=30, center=true);
		translate([-4.2,0,19.5]) rotate([90,90,0]) 
			cylinder(r=2, h=30, center=true);
		// back jhead hotend
		translate([-4.2,0,-20.5]) rotate([90,90,0]) 
			cylinder(r=2, h=30, center=true);
		translate([-4.2,0,-5.5]) rotate([90,90,0]) 
			cylinder(r=2, h=30, center=true);
	}
	// bottom bracing
	translate([-7.5,10,0]) cube(size=[2,4,52], center=true);
	translate([-7.5,-10,0]) cube(size=[2,4,52], center=true);
}

// filament path and prusanozzle mounting holes
module nozzlemount(){
	rotate([0,90,0]) translate([0,2,0]) cylinder(r=2, h=70); // filament cutout
	%rotate([0,90,0]) translate([0,2,-100]) 
		cylinder(r=1.4, h=200, $fn=30); // filament visual path
	//translate([1,0+2,0]) rotate([0,90,0]) cylinder(r1=4, r2=2, h=3);
	translate([0,15+2,0]) rotate([0,90,0]) cylinder(r=2, h=70);
	translate([10-2.8,15+2,0]) rotate([0,90,0]) cylinder(r=3.3, h=70,$fn=6);
	translate([0,-25+2,0]) rotate([0,90,0]) cylinder(r=2, h=70);
	translate([10-2.8,-25+2,0]) rotate([0,90,0]) cylinder(r=3.3, h=70,$fn=6);
}

// mk7 hobbed pulley - for visualization
%translate([21,9,36]) mk7();
%translate([21,9,15.5]) rotate([0,180,0]) mk7();

// idler - for visualization
%translate([0.5,30.5,50]) rotate([0,90,-90]) idler();
%translate([0.5,30.5,25]) rotate([0,90,-90]) idler();

// gears - for visualization
%rotate([0,180,90]) translate([-8,-21,2]) {
	big_gear();
	translate([0,0,-2]) small_gear();
	translate([0,0,-22]) cylinder(r=5/2, h=75, center=true); // M5 bolt
}

// NEMA17 - for visualization
%translate([21,-21,3]) rotate([0,180,0]) nema17();

// construct the extruder body
difference(){
	union(){
		cube([42,19,52]);  							// drivetrain block
		translate([0,-42,0]) cube([42,42+3,3]);  		// NEMA17 motor mount
		translate([-7.99,-42,0])cube([8,80,52]);  	// base
		translate([-1,31,0]) cube([6, 7, 52]);		// idler stop
		translate([-1,15,50]) cube([6, 20, 2]);		// back idler stop
		//translate([-1,15,22]) cube([6, 20, 2]);		// front idler stop

		// jhead mount
		if (jhead_mount) translate([-10.5,13+2,52/2]) jhead();
	}

	// antiwarpagenation: angled corners
	translate([46,-91,-1]) rotate([0,0,45]) cube(40);
	translate([-11,-91,-1]) rotate([0,0,45]) cube([40,40,60]);
	translate([46,13,-1]) rotate([0,0,45]) cube([40,40,60]);
	translate([-12,31,-1]) rotate([0,0,45]) cube([20,20,60]);
	translate([6,33,-1]) rotate([0,0,45]) cube([40,40,60]);

	// NEMA 17 motor circle cutout and mounting holes
	translate([21,-21,-1]) cylinder(r=12, h=5);
	translate([21+15.5,-21+15.5,-1]) cylinder(r=2, h=5);
	translate([21+15.5,-21-15.5,-1]) cylinder(r=2, h=5);
	translate([21-15.5,-21+15.5,-1]) cylinder(r=2, h=5);
	translate([21-15.5,-21-15.5,-1]) cylinder(r=2, h=5);

	// idler bearing cutout from drivetrain block
	translate([21,24,5.5]) cylinder(r=12, h=45);

	// hobbed pulley cutout from drivetrain block
	translate([21,8.1,5.5]) cylinder(r=hobb, h=45);
	translate([-6+20,8,5.5]) cube([14,12,45]);

	// 625zz filament drive bearing cutouts from drivetrain block
	translate([21,9-0.9,-1]) cylinder(r=8.1, h=6); 
		%translate([21,9-0.9,-1]) cylinder(r=8.1, h=6); // visualize it
	translate([21,9-0.9,-5+52-4]) cylinder(r=8.1, h=7.5); 
		%translate([21,9-0.9,-5+52-4]) cylinder(r=8.1, h=7.5); // visualize it

	// filament drive bearing insert cutouts from drivetrain block
	translate([13,8,43]) cube([16.2,20,7.5]);
	translate([-6+21,8,-50+5]) cube([12,12,50]);

	//mounting holes for x-carriage mount from base
	translate([-4,22+(mount_spacing-24)/2,-28]){
		translate([0,0,0]) rotate([0,0,0]) 
			cylinder(r=3.3, h=70, $fn=15);
		translate([0,0-mount_spacing,0]) rotate([0,0,0]) 
			cylinder(r=3.3, h=70, $fn=15);
		translate([0,0,30]) rotate([0,0,0]) 
			cylinder(r=3.3/2, h=70, $fn=15);
		translate([0,0-mount_spacing,30]) rotate([0,0,0]) 
			cylinder(r=3.3/2, h=70, $fn=15);
	}

	// idler nuts and filament channels from drivetrain block and base
	translate([0,0,-2]){
		// PrusaNozzle mount holes
		translate([-10,2+8+4-1,52-12]) nozzlemount();
		translate([-10,2+8+4-1,52-12-25]) nozzlemount();

		// back idler nuts
		translate([33.5,7,52-12-7-3]) cube([15,3,6]);
		translate([33.5,7,52-12-7-3+14]) cube([15,3,6]);

		// front idler nuts
		translate([33.5,7,52-12-25-7-3]) cube([15,3,6]);
		translate([33.5,7,52-12-25+3+1]) cube([15,3,6]);

		// idler nut cutout from backside of motor area
		//translate([5+32,-1,52-12+7]) rotate([0,90,90]) rotate([0,0,30]) cylinder(r=3.3, h=10, $fn=6);
		//translate([5+32,-1,52-12-7]) rotate([0,90,90]) rotate([0,0,30]) cylinder(r=3.3, h=10, $fn=6);

		// idler bolts
		translate([5+32,-1,52-12+7]) rotate([0,90,90]) 
			rotate([0,0,30]) cylinder(r=2, h=40, $fn=6);
		translate([5+32,-1,52-12-7]) rotate([0,90,90]) 
			rotate([0,0,30]) cylinder(r=2, h=40, $fn=6);
		translate([5+32,-1,52-12-25+7]) rotate([0,90,90]) 
			rotate([0,0,30]) cylinder(r=2, h=40, $fn=6);
		translate([5+32,-1,52-12-25-7]) rotate([0,90,90]) 
			rotate([0,0,30]) cylinder(r=2, h=40, $fn=6);

		// pretty cutout - angled idler area corners
		translate([-10,30,0]) rotate([-23,0,0]) cube([20,12,50]);
		translate([0,27,-3]) rotate([0,23,0]) cube([20,12,50]);

		// pretty cutout - angled base underneath NEMA17 motor
		translate([-10,-66,0]) rotate([-23,0,0]) cube([12,20,90]);
		}
	}

