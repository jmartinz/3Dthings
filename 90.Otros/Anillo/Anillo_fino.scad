// Sized RepRap Power Ring
// By fillibar
// Description:
//   This ring is based on the parametric power ring. Rather than use specific values that
//   some may not know I used the "standard" ring sizes for most of the world. Enter the region
//   then the other parameters. The SizedPowerRing module will just call the normal PowerRing
//   module with the correct inner size.
//
// Based on:
//  Parametric RepRap Power Ring by Daniel Harmsworth (http://www.thingiverse.com/thing:3917)
//  RepRap Power Ring by Zack Hoeken (http://www.thingiverse.com/thing:48)
//  Ring sizes per Wikipedia (http://en.wikipedia.org/wiki/Ring_size)
//
// Licensed under the Creative Commons - GNU GPL, http://creativecommons.org/licenses/GPL/2.0/
//
// Parameters are as follows:
// 1) Sets ring sizing region. Values are:
//   0 for United States and Canada
//   1 for UK, Ireland, Australia & New Zealand (Please note: "" is needed around non-numerical values)
//   2 for India, China & Japan
//   3 for Switzerland
// 2) Sets internal ring size based on ring sizes for the region set in parameter 1.
// 3) Sets thickness of the ring (lengthways along the finger).
// 4) Sets depth of the RepRap logo embossed on the ring.
// 5) Sets whether the front edges are beveled or not.


PowerRing( 18, 15, 2, true );
 //Gumcam(15,3);
//TearDrop(15,3);


module PowerRing ( diameter, thick, depth, bevel )
{
  rotate( a = [ 0, 0, 90 ] )
  {
    difference()
    {
      union ()
      {
        translate ( v = [0,-0.5,0] )
        cube( [ ( diameter / 2 ) + 5, diameter + 6, thick], center = false );
        translate( v = [ ( diameter / 2 ) + 5, ( diameter / 2 ) + 2.5, ] )
        cylinder( h = thick, r = ( diameter / 2 ) + 3 );
      }
     translate( v = [(diameter / 2) + 5,(diameter / 2) + 2.5,-1 ] )
     cylinder(h=thick+2,r=diameter / 2);
    
	translate( v = [2,(diameter / 2) + 6,thick / 2-2.2] )
    rotate ( a = [90,0,180])  
	//TearDrop(thick / 3,depth + 1);
    Gumcam(thick / 3,depth + 1); 
	if (bevel)
      {
        /*translate ( v = [0,(diameter / 2)+2.5,0] )
        rotate ( a = [0,45,0])
        cube([3,diameter + 20,3],center = true);
        translate ( v = [0,(diameter / 2)+2.5,thick] )
        rotate ( a = [0,45,0])
        cube([3,diameter + 20,3],center = true);*/
        translate ( v = [0,diameter+7.5,(thick / 2)] )
        rotate ( a = [0,0,45]) 
        cube([3,3,thick + 10],center = true);
        translate ( v = [0,-2.5,(thick / 2)] )
        rotate ( a = [0,0,45])
        cube([3,3,thick + 10],center = true);
      }
    }
  }
}

module TearDrop(radius,depth)
{
  teardiff = (	sqrt(	( (radius * 2) * (radius * 2) ) * 2 ) - (radius * 2) ) / 2;
  translate(v = [depth/2,0,-teardiff / 2])
  rotate(a = [0,-90,0])
  union()
  {
    cylinder(h=depth,r=radius, center = true);
    intersection()
    {
      rotate(a = [0,0,45])
      cube([2*radius,2*radius,depth], center = true);
      translate([1.65*radius, 0, 0])
      cube([2*radius,2*radius,depth], center = true);
    }
  }
}

module Gumcam(radius,depth)
{
	scale([1,radius/28,radius/28])
	rotate(a = [0,90,0])
	linear_extrude(height = depth)
	import("GUMCAMv3.dxf");
}