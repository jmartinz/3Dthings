include <i3 support.scad>
include <frame.scad>
include <Power_Supply_Cover_12v_with_cord_and_switch_.scad>
include <xt60_JMMP.scad>
use <inc/nuts_and_bolts.scad>




i3_SUPPORT_SPACE = 139;
i3_SUPPORT_OFFSET = 86;
i3_FRAME_THICKNESS = 6;

module i3frame() {
	translate([i3_SUPPORT_SPACE,i3_SUPPORT_OFFSET,0]) rotate([90,0,90]) i3Support();
	translate([-1 * i3_SUPPORT_SPACE - i3_FRAME_THICKNESS,i3_SUPPORT_OFFSET,0]) rotate([90,0,90]) i3Support();
	rotate([90,0,0]) frame();	
	translate([0,160,-155]) rotate([0,90,0]) cylinder(r=4, h=380, center=true);
}

PSU_WIDTH = 111;//114;
PSU_LENGTH = 215;
PSU_HEIGHT = 50;
PSU_INSET = 11;//18;
PSU_WALL = 2;
PSU_TERMINAL = 8.3;

module powerSupply() {
	difference() {
		cube([PSU_WIDTH, PSU_LENGTH, PSU_HEIGHT], center = true);
		translate([PSU_WALL,(PSU_LENGTH / 2) - (PSU_INSET / 2),PSU_TERMINAL / 2])
		//cube([PSU_WIDTH - (PSU_WALL * 2),PSU_INSET,PSU_HEIGHT - PSU_TERMINAL], center = true);
		cube([PSU_WIDTH - (PSU_WALL ),PSU_INSET,PSU_HEIGHT - PSU_TERMINAL], center = true);
		translate([PSU_WIDTH/2-PSU_WALL/2,(PSU_LENGTH / 2) - (PSU_INSET / 2),-PSU_TERMINAL / 2])
		cube([PSU_WALL ,PSU_INSET,PSU_HEIGHT - PSU_TERMINAL], center = true);
		translate([0,(PSU_LENGTH / 2)-PSU_INSET/2 ,-PSU_HEIGHT / 2+PSU_WALL/2])
		cube([PSU_WIDTH ,PSU_INSET,PSU_WALL], center = true);
	}
	
}

module powerSwitch() {
	cube([23,32.3,5], center=true);		// JMMP MEDIDAS AGUJERO INTERRUPTOR COMPRADO
	translate([0,0,0]) cube([23,32.3,15], center=true); // JMMP MEDIDAS AGUJERO INTERRUPTOR COMPRADO
}

PC_DEPTH = 40;
PC_THICKNESS = 4.5;

module powerCover() {
	difference() {
		translate([0,(PSU_LENGTH / 2) + (PC_DEPTH  - PSU_INSET) / 2,0]) 
		difference() {
			cube([PSU_WIDTH, PSU_INSET + PC_DEPTH, PSU_HEIGHT+0], center=true);
			innerArea();
			translate([0,-10,0]) innerArea();
			//translate([0,0,-10]) innerArea(); //jmmpponer tapa

			//screw holes			
			translate([-PSU_WIDTH/2,(PSU_INSET + PC_DEPTH)/-2 + (PSU_INSET - 6.5),PSU_HEIGHT/2-(6+2)]) rotate([0,90,0]) cylinder(r=1.5, h=PSU_WIDTH/2, center=true);
			translate([-PSU_WIDTH/2,(PSU_INSET + PC_DEPTH)/-2 + (PSU_INSET - 6.5),PSU_HEIGHT/2-(16.5+2)]) rotate([0,90,0]) cylinder(r=1.5, h=PSU_WIDTH/2, center=true);
			//screw holes			
			translate([PSU_WIDTH/2-7,(PSU_INSET + PC_DEPTH)/-2 + (PSU_INSET - 6.5),PSU_HEIGHT/2-(6+2+40)]) rotate([0,0,0]) cylinder(r=1.5, h=PSU_WIDTH/10, center=true);
			translate([-PSU_WIDTH/2+6,(PSU_INSET + PC_DEPTH)/-2 + (PSU_INSET - 6.5),PSU_HEIGHT/2-(6+2+40)]) rotate([0,0,0]) cylinder(r=1.5, h=PSU_WIDTH/10, center=true);


			//Power Socket Hole
			translate([0.5*PSU_WIDTH +0.5,10,0]) rotate([0,90,0]) powerSocket();
				
			//Power Switch Hole
			translate([0,PSU_INSET/2,(PSU_HEIGHT / 2) + 1]) rotate([0,0,90]) powerSwitch();
				

			
		}	
		powerSupply();
		//xt60 holes
		translate([-PSU_WIDTH/2 +10,PC_DEPTH/2*6+17,PSU_HEIGHT / -2 -6])rotate([-90,0,0])xt60Hole();
		translate([-PSU_WIDTH/2 +40,PC_DEPTH/2*6+16,PSU_HEIGHT / -2 -6])rotate([-90,0,0])xt60Hole();
	}
	//soporte 
	translate([-PSU_WIDTH/2 -3.5, PC_DEPTH*3+7.5, PSU_HEIGHT / -2 +4]) cube([i3_FRAME_THICKNESS+1,PC_DEPTH,8], center=true);
	//xt60 mounts
	translate([-PSU_WIDTH/2 +10,PC_DEPTH/2*6+12.5,PSU_HEIGHT / -2 +20])rotate([-90,0,0])xt60();
	translate([-PSU_WIDTH/2 +40,PC_DEPTH/2*6+12.5,PSU_HEIGHT / -2 +20])rotate([-90,0,0])xt60();
	

	//nut support
	translate([0,(PSU_LENGTH / 2) + (PC_DEPTH  - PSU_INSET) / 2,-10]) translate([PSU_WIDTH/2-7,(PSU_INSET + PC_DEPTH)/-2 + (PSU_INSET - 6.5),PSU_HEIGHT/2-(3+2+40)])nut();
	translate([0,(PSU_LENGTH / 2) + (PC_DEPTH  - PSU_INSET) / 2,-10]) translate([-PSU_WIDTH/2+6,(PSU_INSET + PC_DEPTH)/-2 + (PSU_INSET - 6.5),PSU_HEIGHT/2-(3+2+40)])nut();

}


module innerArea() {
	cube([PSU_WIDTH - (PC_THICKNESS * 3), PSU_INSET + PC_DEPTH - (PC_THICKNESS * 2),PSU_HEIGHT - (PC_THICKNESS * 2)], center=true);
}

/*module xt60(){
	difference(){
		rotate([0,0,-90])import("xt60mount.stl");
		cube([60,25,80],center=true);
	}

}*/

module xt60Hole(){

	xt60();	 //valdría con el cubo de abajo sólamente
	color("red")translate([0,-25,0])cube([25,12.5,12.5]);
}

module nut(d=3){
	difference(){
		translate([0,42/2,d])cube([d*4,51,d*2],center=true);
		nutHole(d, length = 10);
		boltHole(d, length = 10);
		//translate([0,d*4,d/2])rotate([-55,0,0])cube([d*4,d*2.5,d*5],center=true);
	}
//cube([d*4,d*2.5,d*5],center=true);
}

module powerSocket() {
	translate([20,0,-5]) cylinder(r=1.7, h=16, center=true);
	translate([-20,0,-5]) cylinder(r=1.7, h=16, center=true);
	translate([20,0,-13]) cylinder(r=6.4/2, h=7, $fn=6);
	translate([-20,0,-13]) cylinder(r=6.4/2, h=7,  $fn=6);
	hull() {
		minkowski() {
			cube([20.5,12.5,3], center=true);
			cylinder(r=5,h=0.1);
		}
		translate([20,0,0]) cylinder(r=5, h=3, center=true);
		translate([-20,0,0]) cylinder(r=5, h=3, center=true);
	}
	translate([0,0,-5.5 - 1.5])
		minkowski() {
			cube([20,12,11], center=true);
			cylinder(r=4,h=0.1);
		}
}


//color("red")translate([-PSU_WIDTH/2 +10,PC_DEPTH/2*6+15,PSU_HEIGHT / -2 -10])rotate([-90,0,0])xt60();
//color("red")cube([60,25,80],center=true);
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



translate([0,0,148])rotate([-90,0,0])
powerCover();
//color("GhostWhite")powerSupply();
//bracket();
/*color("GhostWhite") i3frame();
translate([i3_SUPPORT_SPACE + i3_FRAME_THICKNESS + (PSU_HEIGHT /  2),PSU_WIDTH / 2,0]) rotate([90,180,90]) {
	powerSupply();
	powerCover();
}*/
		
//nut();
//rotate([-90,0,0])import("parte_1.stl");

//translate([60,0,0]) rotate([0,90,90])color("red")PSC12V();
