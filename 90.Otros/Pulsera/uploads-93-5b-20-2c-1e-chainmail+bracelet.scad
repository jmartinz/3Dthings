/* chainmail bracelet

Gian Pablo Villamil
March 2013

Based on Zomboe's chainmail (http://www.thingiverse.com/thing:8724)

Added clasp mechanism
Printed two layers of chainmail to prevent link rotation
Added (hacky) offset to allow horizontal bridges to clear

Extra bonus bitchain() module allows for multi color printing

*/

// Variables

	layer_thick = 0.27;  //filament layer thickness
	line_width = 0.4;    //filament line width, = layer thickness * width/thickness
	
	b_width = 2;	//block width in lines
	b_height = 6;    //block height in layers
	d_height = 2; 		//diagonals height in lines

	r_halfwidth = .95+1.5*line_width*b_width+0.45; //ring inner half width
	corner = tan(22.5)*line_width*b_width;  	  //fills in corner between block and diagonal

claspwidth = 39;
claspheight = b_height * layer_thick * 2;
claspthick = 3; // in layers
claspsides = 6;

offsetmod = 0.8;

bitmap =
[
[ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1],
[ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
[ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]];


module ring(modifier)
{
	module blocks()  //four blocks
	{	
		for (i = [0:3]){		
		rotate([0,0,90*i])
			translate([-0.6001,r_halfwidth,0])
				cube([1.2002,line_width*b_width,layer_thick*b_height]); }
	}

	module diagonal() 	//thin diagonals
		{
			mirror([-1,1,0])
				translate([0.6,r_halfwidth,0])
				union() {
				cube([corner,line_width*b_width,layer_thick*d_height]);
				rotate([0,0,-45])
					translate([-corner,0,0])
					cube([corner,line_width*b_width,layer_thick*d_height]);
				}
			translate([0.6,r_halfwidth,0])
			union() {
				cube([corner,line_width*b_width,layer_thick*d_height]);
				rotate([0,0,-45])
					translate([-corner,0,0])
					cube([corner,line_width*b_width,layer_thick*d_height]);
				rotate([0,0,-45])
					cube([sqrt(2)*(r_halfwidth-0.6),line_width*b_width,layer_thick*d_height]);
					}	
		}
	module 4_diagonals(mod) //all four diagonals
		{
		translate([0,0,0]) union(){
		diagonal();
		mirror([1,1,0]) diagonal(); 
}
		translate([0,0,layer_thick*(b_height-d_height)*mod]) 
			union(){
				rotate([0,0,90]) diagonal();
				rotate([0,0,-90]) diagonal(); }				
		}

union(){
	blocks();
	4_diagonals(modifier);	
	}	
}

module chain(w,h,m) {

module line() {
	for(i=[0:w-1]){
		translate([i*(2*r_halfwidth-.55),0,0])
		ring(m);
		}
	}

for(j=[0:h-1]){
	translate([0,j*(2*r_halfwidth-.55),0])
	line();
	}
}

module bitchain(w,h,c,m) {
	for(i=[0:w-1]) {
		for(j=[0:h-1]) {
			translate([i*(2*r_halfwidth-.45),j*(2*r_halfwidth-.45),0])
			if(bitmap[i][j]==c) {
			ring(m);}
		}
	}
}

module clasp_male() {
	cube([10,claspwidth,layer_thick*b_height*2]);
		translate([-8,claspsides+0.25,(claspthick+1)*layer_thick]) 
		difference() {
			cube([8,claspwidth-(claspsides*2)-0.5,4*layer_thick]); // tongue

			translate([7,0,0]) cube([1,3,4*layer_thick]);
			translate([2,2,0]) cube([5,1,4*layer_thick]);

			translate([7,claspwidth-(claspsides*2)-3.5,0]) cube([1,3,4*layer_thick+1]);
			translate([2,claspwidth-(claspsides*2)-3.5,0]) cube([5,1,4*layer_thick]);


}

//bumps

	translate([-2.75,claspsides+0.5,(claspthick+1)*layer_thick]) cylinder(r=1.5,h=4*layer_thick,$fn=16);
	translate([-2.75,claspsides-0.5+(claspwidth-claspsides*2),(claspthick+1)*layer_thick]) cylinder(r=1.5,h=4*layer_thick,$fn=16);

// supports

		translate([-8,claspsides+0.25,0]) cube([0.4,claspwidth-(claspsides*2)-0.5,4*layer_thick]);
		translate([-6.5,claspsides+0.25,0]) cube([0.4,claspwidth-(claspsides*2)-0.5,4*layer_thick]);

		translate([-5,claspsides+0.25,0]) cube([0.4,claspwidth-(claspsides*2)-0.5,4*layer_thick]);
		translate([-3,claspsides+0.25-2,0]) cube([0.4,claspwidth-(claspsides*2)+3,4*layer_thick]);

		translate([-1.5,claspsides+0.25,0]) cube([0.4,claspwidth-(claspsides*2)-0.5,4*layer_thick]);



}

module clasp_female() {
	cube([10,claspwidth,layer_thick*claspthick]); // bottom
	translate([0,0,claspheight-(layer_thick*claspthick)]) cube([10,claspwidth,layer_thick*claspthick]); // top

	translate([0,0,layer_thick*claspthick]) cube([2,claspwidth,claspheight-(layer_thick*claspthick)]); // back

	translate([0,0,layer_thick*claspthick]) 
		difference() {
		cube([10,claspsides,claspheight-(layer_thick*claspthick)]);
		translate([7,claspsides+0.5,0]) cylinder(r=2,h=claspheight-(layer_thick*claspthick)+1,$fn=16);
}

	translate([0,claspwidth-claspsides,layer_thick*claspthick]) 
		difference() {
		cube([10,claspsides,claspheight-(layer_thick*claspthick)]);
		translate([7,-0.5,0]) cylinder(r=2,h=claspheight-(layer_thick*claspthick)+1,$fn=16);

}

}

module bracelet() {

//usage: chain(w,h) gives w columns, h rows

translate([-34*r_halfwidth,-7*r_halfwidth,0])
chain(38,8,0.8);
translate([-34*r_halfwidth,-7*r_halfwidth,b_height*layer_thick])
chain(38,8,1.0);

translate([170/2+1,-(claspwidth/2+2),0])
clasp_female();

translate([-170/2-16,-(claspwidth/2+2),0])
clasp_male();

//translate([-170/2,-(claspwidth/2+2),0])
//cube([170,claspwidth,1]);

}

module colorchain() {


translate([-15*r_halfwidth,-15*r_halfwidth,0]) {
color ("blue") bitchain(16,16,0,0.8);
color ("white") bitchain(16,16,1,0.8);}



translate([-15*r_halfwidth,-15*r_halfwidth,b_height*layer_thick]) {
color ("blue") bitchain(16,16,0,1.0);
color ("white") bitchain(16,16,1,1.0);}

}

//
bracelet();
//translate([-20.25,0,0]) clasp_female();
//clasp_male();

//%cube([225,145,1],center=true);
