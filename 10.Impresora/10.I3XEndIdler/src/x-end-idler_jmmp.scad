// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>
use <inc/nuts_and_bolts.scad>

module x_end_idler_base(){
 x_end_base();

}

module x_end_idler_holes(){
 x_end_holes();
 translate(v=[0,-25,30.25]) rotate(a=[0,-90,0]) cylinder(h = 80, r=2.2, $fn=30);
}

// Final part
module x_end_idler(){
 mirror([0,1,0]) difference(){
  x_end_idler_base();
  x_end_idler_holes();
 }
}

module x_end_idler_jmmp_base(){
	
difference(){
		x_end_idler();
		translate(v=[40,30,30]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 80, r=18.4, $fn=6);
		//translate(v=[-14,25,30]) cube(size = [15,9,32], center = true);// agujero para alinear con soporte

	}
	translate(v=[-5.5-10+1.5,-6.5,30]) cube(size = [10,6,32], center = true);
}
  


module x_end_idler_jmmp_hole(){
	translate(v=[-5.5-10+1.5,-15.5,30])rotate(a=[-90,0,0]) boltHole(3, length = 100);
}

module x_end_idler_jmmp(){
	difference(){
		x_end_idler_jmmp_base();
		x_end_idler_jmmp_hole();
	}

}

x_end_idler_jmmp();

module soporte(){
	/*difference(){
		translate(v=[-14,25,30]) cube(size = [17,9,33], center = true);
		translate(v=[-14,25,30]) cube(size = [16,11,33], center = true);

	}*/
translate(v=[-14,29,30])cube(size = [12,0.5,33], center = true);
translate(v=[-6,25,30])cube(size = [0.5,9,33], center = true);
translate(v=[-22,25,30])cube(size = [0.5,9,33], center = true);
}

soporte();
