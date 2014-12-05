// Big gear for the samrt lock based on:
// Wade's Extruder Gears using Parametric Involute Bevel and Spur Gears by GregFrost
// by Nicholas C. Lewis (A RepRap Breeding Program)
//
// It is licensed under the Creative Commons - GNU GPL license.
// © 2010 by Nicholas C. Lewis
// http://www.thingiverse.com/thing:4305


use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>

ref_twist=200; //EMG
ref_height=11/2; //EMG


module WadeL_double_helix(){
	//Large WADE's Gear - Double Helix


	circles=4;
	teeth=47;
	pitch=268;
	twist=ref_twist; //EMG: era twist=200;
	height=2*ref_height; //EMG: era height=11;
	pressure_angle=30;

	difference(){
		union(){
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =0,// height/2*0.5,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2*1.5,
			hub_diameter = 25,
			bore_diameter = 8,
			circles=circles,
			twist = twist/teeth);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2,
			hub_diameter=25,
			bore_diameter=8,
			circles=circles,
			twist=twist/teeth);
		}
		//translate([0,0,3])rotate([180,0,0])m8_hole_vert_with_hex(100);
	}
}

module encastre(){
	difference(){
		scale (v=[6,3,1])cylinder(h = 40, r=5, center = true);
		translate([0,0,8])scale (v=[3.8,2,1])cylinder(h = 25, r=5, center = true);
		//cube(size = [38,20,35], center = true);
	
	}

}
difference(){
	WadeL_double_helix();
rotate([0,0,45])scale (v=[6,3,1])cylinder(h = 40, r=5, center = true);

}

	translate([0,0,20-5.5])rotate([0,0,45])encastre();