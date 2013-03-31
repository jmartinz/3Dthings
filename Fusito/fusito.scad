// Fusito v2.0
// http://clonewars.es
//
// based on William Adams' excellent ball-and-socket code
use <WriteSVG.scad>

disc_radius = 32;			// radius of the disc
ball_radius = 10;			// joint hole radius
expansion_factor = 1.11;		// wiggle room, adjust if you dare!
goldenratio = 1.61803399;

// uncomment either of these to create a 5 or 6-way hub
//build_hexagon();
//build_pentagon();



cylinder(r=6/2, h=12, $fn=64);

translate([0,0,-5])
cylinder(r1=0.5/2, r2=6/2,h=5, $fn=64);

translate([0,0,3])
cylinder(r=10/2, h=5, $fn=64);

translate([-5,3,3])
difference(){
scale ([10,5.5,5]) cube(1);
translate([0,3.3,2.5]) rotate([0,90,0]) cylinder(r=3/2, h=12, $fn=64);
}

translate([0,0,11.5])rotate([0,-7,0])
cylinder(r=9/2, h=2, $fn=64);

translate([0,0,13])
cylinder(r=14/2, h=7, $fn=64);

translate([0,0,20]) 
difference(){
cylinder(r=20/2, h=1, $fn=64);
   writecylinder("Cole",[0,0,0],20/2,1.2,face="top" );
}
translate([-1,0,23]) 
linear_extrude(height = 5, center = true, convexity = 10, twist = 180, $fn = 100)
translate([1, 0, 0])
circle(r =0.5);

translate([4,-5.5,17])
sphere(1, $fa=5, $fs=0.1); 
translate([-4,-5.5,17])
sphere(1, $fa=5, $fs=0.1); 