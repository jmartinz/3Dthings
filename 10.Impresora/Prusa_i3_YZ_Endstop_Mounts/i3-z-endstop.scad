//
// i3-z-endstop.scad
//

include <common.scad>

draw_assembled = false;

is_adjustable = false;
draw_adjuster = true;
draw_slider = true;
draw_holder = true;
jmmp = true;

adjuster_height = 8;
adjuster_dist = 2.5;
play_gap = adjuster_dist / 2;

min_adj_home = clip_h + adjuster_height + pt2 + play_gap / 2;

z_home_pos = min_adj_home + 10; // top of endstop. (min_adj_home = no extra mounting)

/**
 *	Draw the parts for printing or in the assembly
 */
if (draw_assembled) {
	i3_z_endstop(draw_adjuster=is_adjustable,draw_holder=is_adjustable,draw_slider=is_adjustable);
	rod_and_frame();
}
else {
	if (is_adjustable) assign(flip=(z_home_pos==min_adj_home)) {
		rotate(flip ? [0,180,180] : [0,0,0])
		translate(flip ? [0,0,-9.2] : [0,0,0])
			i3_z_endstop(draw_adjuster=draw_adjuster,draw_holder=false,draw_slider=false);
		i3_z_endstop(draw_adjuster=false,draw_holder=false,draw_slider=draw_slider);
		i3_z_endstop(draw_adjuster=false,draw_holder=draw_holder,draw_slider=false);
	}
	else {
		i3_z_endstop();
	}
}

module i3_z_endstop(draw_adjuster=false, draw_holder=true, draw_slider=false) {

	clip_r = radius_8mm + part_thickness;
	frame_clip_len = rod_frame_gap + frame_thickness + part_thickness + radius_8mm;

	adj_z = z_home_pos - clip_h - play_gap / 2;
	adj_box_hi = adjuster_height + part_thickness;
	adj_box_size = 10;
	adj_box_len = 16;
	adj_slide_len = adj_box_len - 5;
	adj_offset_y = -2.5;
	adj_box_bottom = pt2;
	adjuster_center = [-adj_box_size / 2 - pt2, adj_offset_y, (adj_z - adjuster_height) / 2 - pt2];
	slider_tab_r = 1.2;

	// Z Endstop Holder
	if (draw_holder)
	color([1,1,1])
	translate(draw_assembled ? [0,0,z_home_pos-clip_h] : is_adjustable ? [-5-adjuster_height,-frame_clip_len/2,clip_r] : [0,0,0])
	rotate(draw_assembled || !is_adjustable ? [0,0,0] : [0,-90,0])
	union() {

		// rod mount
		difference() {
			cylinder(r=clip_r, h=clip_h);
			translate([0,0,-0.1]) cylinder(r=radius_8mm, h=clip_h + 0.2);
			difference() {
				translate([5.2, 0, clip_h / 2]) rotate([0,0,45]) cube([7, 10, clip_h + 0.1], center=true);
				translate([5, (radius_8mm + 10) / 2, clip_h / 2]) cube([11, 6, clip_h + 0.1], center=true);
			}
			// color([0,0,0]) translate([10/2, radius_8mm / 2, clip_h / 2]) cube([10, radius_8mm, clip_h + 3], center=true);
		}

		// frame mount
		translate([-radius_8mm, 0, clip_h / 2]) {
			translate([-pt2, frame_clip_len / 2]) cube([part_thickness, frame_clip_len, clip_h], center=true);
			translate([6 / 2 + 1.5, frame_clip_len - pt2]) cube([10, part_thickness, clip_h], center=true);
		}

		// A Height Adjuster tab!
		if (is_adjustable) assign(tab_extra=1.5) {
			translate([-radius_8mm - pt2 + tab_extra / 2, radius_8mm + adj_offset_y + pt2 + 13.8, -adjuster_height/2]) {
				difference() {
					// Attach the tab to the holder
					cube([part_thickness + tab_extra, adj_box_len - 0.5, adjuster_height], center=true);
					// Make a hole for the slider
					hull() {
						for(v=[-1,1]) translate([0,v*adj_slide_len/2,-v*adjuster_dist/2]) rotate([0,90,0])
							cylinder(r=slider_tab_r+0.05, h=part_thickness + tab_extra + 0.1, center=true);
					}
				}
			}
		}

        if(jmmp)
        translate( [-endstop_h,-endstop_w/2,0] ) // JMMP
		endstop_holder();
        difference() {
				endstop_holder();
				translate([-3.2,6.3,-2])cube([endstop_h,endstop_w,40]);
			}
        //translate([-3.2,6.3,-2])color("red")cube([endstop_h,endstop_w,40]);
        
        if(!jmmp)
        endstop_holder();
	} // end: Z Endstop Holder

	// Z Endstop Adjuster
	if (draw_adjuster)
	translate(draw_assembled ? [0,0,0] : [2,-frame_clip_len/2,adj_z])
	rotate(draw_assembled ? [0,0,0] : [0,180,0])
	union() {

		// Adjuster rod clip
		color([1,0.8,0]) difference() {
			cylinder(r=clip_r, h=adj_z);
			translate([0,0,-0.1]) cylinder(r=radius_8mm, h=adj_z + 0.2);
			difference() {
				translate([5.2, 0, adj_z / 2]) rotate([0,0,45]) cube([7, 10, adj_z + 0.1], center=true);
				translate([5, (radius_8mm + 10) / 2, adj_z / 2]) cube([11, 6, adj_z + 0.1], center=true);
			}
			// color([0,0,0]) translate([10/2, radius_8mm / 2, adj_z / 2]) cube([10, radius_8mm, adj_z + 3], center=true);
		}

		// Adjuster outer wall
		translate([-radius_8mm - pt2, frame_clip_len / 2, adj_z / 2]) {
			color([1,0.8,0])
			difference() {
				union() {
					// front-to-back straight wall
					cube([part_thickness, frame_clip_len, adj_z], center=true);
					// Adjuster Box - holds the adjuster block
					translate(adjuster_center + [0,0,-adj_box_bottom / 2 + pt2])
						cube([adj_box_size+part_thickness, adj_box_len+part_thickness*2, adj_box_hi - part_thickness + adj_box_bottom], center=true);
				}

				// Cutout in the front-to-back wall
				if (z_home_pos>min_adj_home)
					assign(hi=adj_z-adj_box_hi)
						translate([0, -(frame_thickness+part_thickness*2)/2, -(adj_box_hi+0.1)/2])
							cube([part_thickness+0.1, frame_clip_len -(frame_thickness+part_thickness*2), hi+0.1], center=true);

				// gap for endstop adjuster tab
				translate(adjuster_center) {
					translate([pt2+pt2/2,0,part_thickness])
						cube([adj_box_size+pt2+0.2, adj_box_len, adj_box_hi + 0.1], center=true);
				}

				// front-to-back adjuster screw hole
				translate(adjuster_center + [pt2/2,0,pt2])
					rotate([90,0,0])
						cylinder(r=radius_3mm, h=adj_box_len+part_thickness*2+0.1, center=true);
			}
		}

		// Adjuster frame-clips
		color([1,0.8,0]) for (y=[0,-(frame_thickness+part_thickness)])
			translate([-radius_8mm + 6 / 2 + 1.5, frame_clip_len - pt2 + y, adj_z / 2])
				difference() {
					cube([10, part_thickness, adj_z], center=true);
					if (y == 0)
						translate([0,0,0])
							rotate([90,0,0])
								cylinder(r=radius_3mm-0.2, h=part_thickness+0.1, center=true);
				}

		if (draw_assembled)
			assign(len=adj_box_len+part_thickness*2, xtr=3)
			color([0.8,0.8,0.8])
			translate([-radius_8mm - pt2, frame_clip_len / 2, adj_z / 2] + adjuster_center + [pt2/2,len/2+xtr-0.1,pt2])
				rotate([90,0,0])
					screw(r=radius_3mm-0.1,length=len+xtr, hex=true);

	} // end: Z Endstop Adjuster

	// Adjuster slider
	if (draw_slider)
	assign(slider_width=adj_box_size-pt2-0.5)
	translate(draw_assembled ? [-radius_8mm - pt2, frame_clip_len / 2, adj_z / 2] + adjuster_center + [pt2/2,0,pt2] : [0,0,(adj_box_size-1.5)/2])
	rotate(draw_assembled ? [0,0,0] : [0,-90,0])
	{
		difference() {
			// main body of the adjuster slider
			cube([slider_width, adj_box_size, adjuster_height - 0.2], center=true);
			rotate([90,0,0]) {
				// screw hole
				cylinder(r=radius_3mm, h=adj_box_size+0.1, center=true);
				// nut trap hexagon with point down
				rotate([0,0,30]) cylinder(r=radius_3mm+1.6, h=2.25, center=true, $fn=6);
				// nut trap opening cube
				translate([0, adjuster_height / 2 / 2, 0])
					cube([radius_3mm+4, adjuster_height / 2 + 0.1, 2.25], center=true);
			}
		}
		translate([(slider_width+part_thickness+1.5) / 2,0,play_gap/2]) rotate([0,90,0]) {
			hull() for (v=[-1,1]) translate([v*adjuster_dist/4,v*adj_slide_len/4,0])
				cylinder(r=slider_tab_r, h=part_thickness+1.5+0.1, center=true);
		}
	}

}

module rod_and_frame() {
	color([0.8,0.8,0.8]) translate([0,0,-40]) cylinder(r=radius_8mm, h=240);
	color([0.9,0.9,0.9]) translate([-radius_8mm, rod_frame_gap + radius_8mm, -40]) cube([40, frame_thickness, 240]);
	color([0.95,0.95,0.8]) {
		translate([0,6.25,-5/2]) cube([15, 45, 5], center=true);
		translate([20,21.3,-5/2]) cube([45, 15, 5], center=true);
	}
}
