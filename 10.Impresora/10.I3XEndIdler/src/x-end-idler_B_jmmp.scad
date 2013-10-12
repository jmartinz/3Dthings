// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/nuts_and_bolts.scad>

module x_end_idler_jmmp_b(){
$fn=6;
	difference(){
		union(){
			translate(v=[-5.5,30,30]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 17, r=16.5, $fn=6);
			translate(v=[-5.5-10+1.5,13,30]) cube(size = [8,39-6,26], center = true);


		}
		translate(v=[-30,30,0])cube([30,30,60]);
		translate(v=[-14,25,30.25]) rotate(a=[0,-90,0]) X_end_I_B_holes();
		translate(v=[-5.5-10+1.5,13,30]) cube(size = [11,20-6,18], center = true);
		translate(v=[-5.5-10+1.5,3.3,30])rotate(a=[90,0,0]) boltHole(3, length = 100);//3.3
	}
	translate(v=[-14,8,38])rotate(a=[-52,0,0])cube(size = [8,5,10], center = true);
	translate(v=[-14,8,22])rotate(a=[52,0,0])cube(size = [8,5,10], center = true);
}


module X_end_I_B_holes(){
	wall= 1.2;
	clearence= 1; //0.1; 
	cylinder(r=6.5+wall+clearence+2*wall, h=9+2, $fn=50,center=true);
	cylinder(h = 80, r=2.2, $fn=30,center=true);

}


translate(v=[-5.5-10+1.5,13,30])rotate(a=[-90,0,0])x_end_idler_jmmp_b();


//x_end_idler_jmmp_b();