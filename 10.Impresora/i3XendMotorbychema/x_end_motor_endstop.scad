// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <x-end.scad>

module x_end_motor_base(){
 x_end_base();
 translate(v=[-14,31,26.5]) cube(size = [17,44,53], center = true);
 //%translate(v=[0,31,26.5]) cube(size = [17,44,53], center = true);
//Nut trap
 // Cube
 translate(v=[-5,12,56]) rotate([0,0,90]) cube(size = [7,8,8], center = true);
 // Hexagon
 translate(v=[-3,11.5,52]) rotate([0,0,0]) cylinder(h = 8, r=5, $fn = 16);
 //soporte
 translate(v=[-8.7,5.4,38.5]) rotate([-20,20,0]) cylinder(h = 18, r=5, $fn = 26);
}

module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-0,32,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);
  // Motor mounting holes
  translate(v=[-10,-15.5,-15.5]) cube(size = [60,3.5,3.5], center = true);
  translate(v=[-10,-15.5,15.5]) cube(size = [60,3.5,3.5], center = true);
  translate(v=[-10,15.5,-15.5]) cube(size = [60,3.5,3.5], center = true);
  translate(v=[-10,15.5,15.5]) cube(size = [60,3.5,3.5], center = true);
  // Material saving cutout
  translate(v=[-10,40,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);
  // Motor shaft cutout
  translate(v=[0,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 80, r=18, $fn=6);
// Nut trap
 translate(v=[-2.5,-20,1]) cylinder(h = 30, r=1.45, $fn = 8);
 translate(v=[-2.5,-20,4.5]) rotate([0,0,0]) cylinder(h = 15, r=2.5, $fn = 6);
 }
}

// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }
}

x_end_motor();