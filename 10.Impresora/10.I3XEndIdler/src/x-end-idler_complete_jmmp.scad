// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <x-end-idler_jmmp.scad>
use <x-end-idler_B_jmmp.scad>
use <thumb_wheel_Xidler.scad>
use <belt-guide.scad>

module belt_guide_comp(){
	translate([-4.6,0,0])rotate([0,90,0])belt_guide();
	translate([4.6,0,0])rotate([0,-90,0])belt_guide();
}

x_end_idler_jmmp();

x_end_idler_jmmp_b();

translate([-13.8,-10,30])rotate([90,0,0])twX();
translate([-13.8,25,30])belt_guide_comp();