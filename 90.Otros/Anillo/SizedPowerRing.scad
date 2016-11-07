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

// The following examples all generate the same ring, per region:
//SizedPowerRing ( 0, 13, 25, 1, true );
//SizedPowerRing ( 1, "N.5", 25, 1, true );
//SizedPowerRing ( 2, 14, 25, 1, true );
//SizedPowerRing ( 3, 15.25, 25, 1, true );
PowerRing( 15.5, 15, 2, true );

module SizedPowerRing ( region, size, thickness, depth, beveled )
{
  if ( region == 0 ) {
    if ( size == 0 ) {
      PowerRing( 11.63, thickness, depth, beveled );
    }
    if ( size == 0.25 ) {
      PowerRing( 11.84, thickness, depth, beveled );
    }
    if ( size == 0.5 ) {
      PowerRing( 12.04, thickness, depth, beveled );
    }
    if ( size == 0.75 ) {
      PowerRing( 12.24, thickness, depth, beveled );
    }
    if ( size == 1 ) {
      PowerRing( 12.45, thickness, depth, beveled );
    }
    if ( size == 1.25 ) {
      PowerRing( 12.65, thickness, depth, beveled );
    }
    if ( size == 1.5 ) {
      PowerRing( 12.85, thickness, depth, beveled );
    }
    if ( size == 1.75 ) {
      PowerRing( 13.06, thickness, depth, beveled );
    }
    if ( size == 2 ) {
      PowerRing( 13.26, thickness, depth, beveled );
    }
    if ( size == 2.25 ) {
      PowerRing( 13.46, thickness, depth, beveled );
    }
    if ( size == 2.5 ) {
      PowerRing( 13.67, thickness, depth, beveled );
    }
    if ( size == 2.75 ) {
      PowerRing( 13.87, thickness, depth, beveled );
    }
    if ( size == 3 ) {
      PowerRing( 14.07, thickness, depth, beveled );
    }
    if ( size == 3.25 ) {
      PowerRing( 14.27, thickness, depth, beveled );
    }
    if ( size == 3.5 ) {
      PowerRing( 14.48, thickness, depth, beveled );
    }
    if ( size == 3.75 ) {
      PowerRing( 14.68, thickness, depth, beveled );
    }
    if ( size == 4 ) {
      PowerRing( 14.88, thickness, depth, beveled );
    }
    if ( size == 4.25 ) {
      PowerRing( 15.09, thickness, depth, beveled );
    }
    if ( size == 4.5 ) {
      PowerRing( 15.29, thickness, depth, beveled );
    }
    if ( size == 4.75 ) {
      PowerRing( 15.49, thickness, depth, beveled );
    }
    if ( size == 5 ) {
      PowerRing( 15.70, thickness, depth, beveled );
    }
    if ( size == 5.25 ) {
      PowerRing( 15.90, thickness, depth, beveled );
    }
    if ( size == 5.5 ) {
      PowerRing( 16.10, thickness, depth, beveled );
    }
    if ( size == 5.75 ) {
      PowerRing( 16.31, thickness, depth, beveled );
    }
    if ( size == 6 ) {
      PowerRing( 16.51, thickness, depth, beveled );
    }
    if ( size == 6.25 ) {
      PowerRing( 16.71, thickness, depth, beveled );
    }
    if ( size == 6.5 ) {
      PowerRing( 16.92, thickness, depth, beveled );
    }
    if ( size == 6.75 ) {
      PowerRing( 17.12, thickness, depth, beveled );
    }
    if ( size == 7 ) {
      PowerRing( 17.32, thickness, depth, beveled );
    }
    if ( size == 7.25 ) {
      PowerRing( 17.53, thickness, depth, beveled );
    }
    if ( size == 7.5 ) {
      PowerRing( 17.73, thickness, depth, beveled );
    }
    if ( size == 7.75 ) {
      PowerRing( 17.93, thickness, depth, beveled );
    }
    if ( size == 8 ) {
      PowerRing( 18.14, thickness, depth, beveled );
    }
    if ( size == 8.25 ) {
      PowerRing( 18.34, thickness, depth, beveled );
    }
    if ( size == 8.5 ) {
      PowerRing( 18.54, thickness, depth, beveled );
    }
    if ( size == 8.75 ) {
      PowerRing( 18.75, thickness, depth, beveled );
    }
    if ( size == 9 ) {
      PowerRing( 18.95, thickness, depth, beveled );
    }
    if ( size == 9.25 ) {
      PowerRing( 19.15, thickness, depth, beveled );
    }
    if ( size == 9.5 ) {
      PowerRing( 19.35, thickness, depth, beveled );
    }
    if ( size == 9.75 ) {
      PowerRing( 19.56, thickness, depth, beveled );
    }
    if ( size == 10 ) {
      PowerRing( 19.76, thickness, depth, beveled );
    }
    if ( size == 10.25 ) {
      PowerRing( 19.96, thickness, depth, beveled );
    }
    if ( size == 10.5 ) {
      PowerRing( 20.17, thickness, depth, beveled );
    }
    if ( size == 10.75 ) {
      PowerRing( 20.37, thickness, depth, beveled );
    }
    if ( size == 11 ) {
      PowerRing( 20.57, thickness, depth, beveled );
    }
    if ( size == 11.25 ) {
      PowerRing( 20.78, thickness, depth, beveled );
    }
    if ( size == 11.5 ) {
      PowerRing( 20.98, thickness, depth, beveled );
    }
    if ( size == 11.75 ) {
      PowerRing( 21.18, thickness, depth, beveled );
    }
    if ( size == 12 ) {
      PowerRing( 21.39, thickness, depth, beveled );
    }
    if ( size == 12.25 ) {
      PowerRing( 21.59, thickness, depth, beveled );
    }
    if ( size == 12.5 ) {
      PowerRing( 21.79, thickness, depth, beveled );
    }
    if ( size == 12.75 ) {
      PowerRing( 22.00, thickness, depth, beveled );
    }
    if ( size == 13 ) {
      PowerRing( 22.20, thickness, depth, beveled );
    }
    if ( size == 13.25 ) {
      PowerRing( 22.40, thickness, depth, beveled );
    }
    if ( size == 13.5 ) {
      PowerRing( 22.61, thickness, depth, beveled );
    }
    if ( size == 13.75 ) {
      PowerRing( 22.81, thickness, depth, beveled );
    }
    if ( size == 14 ) {
      PowerRing( 23.01, thickness, depth, beveled );
    }
    if ( size == 14.25 ) {
      PowerRing( 23.22, thickness, depth, beveled );
    }
    if ( size == 14.5 ) {
      PowerRing( 23.42, thickness, depth, beveled );
    }
    if ( size == 14.75 ) {
      PowerRing( 23.62, thickness, depth, beveled );
    }
    if ( size == 15 ) {
      PowerRing( 23.83, thickness, depth, beveled );
    }
    if ( size == 15.25 ) {
      PowerRing( 24.03, thickness, depth, beveled );
    }
    if ( size == 15.5 ) {
      PowerRing( 24.23, thickness, depth, beveled );
    }
    if ( size == 15.75 ) {                                                                            
      PowerRing( 24.43, thickness, depth, beveled );
    }
    if ( size == 16 ) {                                                                                                       
      PowerRing( 24.64, thickness, depth, beveled );
    }
  } 
  if ( region == 1 ) {
    if ( size == "A" ) {
      PowerRing( 12.04, thickness, depth, beveled );
    }
    if ( size == "A.5" ) {
      PowerRing( 12.24, thickness, depth, beveled );
    }
    if ( size == "B" ) {
      PowerRing( 12.45, thickness, depth, beveled );
    }
    if ( size == "B.5" ) {
      PowerRing( 12.65, thickness, depth, beveled );
    }
    if ( size == "C" ) {
      PowerRing( 12.85, thickness, depth, beveled );
    }
    if ( size == "C.5" ) {
      PowerRing( 13.06, thickness, depth, beveled );
    }
    if ( size == "D" ) {
      PowerRing( 13.26, thickness, depth, beveled );
    }
    if ( size == "D.5" ) {
      PowerRing( 13.46, thickness, depth, beveled );
    }
    if ( size == "E" ) {
      PowerRing( 13.67, thickness, depth, beveled );
    }
    if ( size == "E.5" ) {
      PowerRing( 13.87, thickness, depth, beveled );
    }
    if ( size == "F" ) {
      PowerRing( 14.07, thickness, depth, beveled );
    }
    if ( size == "F.5" ) {
      PowerRing( 14.27, thickness, depth, beveled );
    }
    if ( size == "G" ) {
      PowerRing( 14.48, thickness, depth, beveled );
    }
    if ( size == "G.5" ) {
      PowerRing( 14.68, thickness, depth, beveled );
    }
    if ( size == "H" ) {
      PowerRing( 14.88, thickness, depth, beveled );
    }
    if ( size == "H.5" ) {
      PowerRing( 15.09, thickness, depth, beveled );
    }
    if ( size == "I" ) {
      PowerRing( 15.29, thickness, depth, beveled );
    }
    if ( size == "J" ) {
      PowerRing( 15.49, thickness, depth, beveled );
    }
    if ( size == "J.5" ) {
      PowerRing( 15.70, thickness, depth, beveled );
    }
    if ( size == "K" ) {
      PowerRing( 15.90, thickness, depth, beveled );
    }
    if ( size == "K.5" ) {
      PowerRing( 16.10, thickness, depth, beveled );
    }
    if ( size == "L" ) {
      PowerRing( 16.31, thickness, depth, beveled );
    }
    if ( size == "L.5" ) {
      PowerRing( 16.51, thickness, depth, beveled );
    }
    if ( size == "M" ) {
      PowerRing( 16.71, thickness, depth, beveled );
    }
    if ( size == "M.5" ) {
      PowerRing( 16.92, thickness, depth, beveled );
    }
    if ( size == "N" ) {
      PowerRing( 17.12, thickness, depth, beveled );
    }
    if ( size == "N.5" ) {
      PowerRing( 17.32, thickness, depth, beveled );
    }
    if ( size == "O" ) {
      PowerRing( 17.53, thickness, depth, beveled );
    }
    if ( size == "O.5" ) {
      PowerRing( 17.73, thickness, depth, beveled );
    }
    if ( size == "P" ) {
      PowerRing( 17.93, thickness, depth, beveled );
    }
    if ( size == "P.5" ) {
      PowerRing( 18.14, thickness, depth, beveled );
    }
    if ( size == "Q" ) {
      PowerRing( 18.34, thickness, depth, beveled );
    }
    if ( size == "Q.5" ) {
      PowerRing( 18.54, thickness, depth, beveled );
    }
    if ( size == "R" ) {
      PowerRing( 18.75, thickness, depth, beveled );
    }
    if ( size == "R.5" ) {
      PowerRing( 18.95, thickness, depth, beveled );
    }
    if ( size == "S" ) {
      PowerRing( 19.15, thickness, depth, beveled );
    }
    if ( size == "S.5" ) {
      PowerRing( 19.35, thickness, depth, beveled );
    }
    if ( size == "T" ) {
      PowerRing( 19.56, thickness, depth, beveled );
    }
    if ( size == "T.5" ) {
      PowerRing( 19.76, thickness, depth, beveled );
    }
    if ( size == "U" ) {
      PowerRing( 19.96, thickness, depth, beveled );
    }
    if ( size == "U.5" ) {
      PowerRing( 20.17, thickness, depth, beveled );
    }
    if ( size == "V" ) {
      PowerRing( 20.37, thickness, depth, beveled );
    }
    if ( size == "V.5" ) {
      PowerRing( 20.57, thickness, depth, beveled );
    }
    if ( size == "W" ) {
      PowerRing( 20.78, thickness, depth, beveled );
    }
    if ( size == "W.5" ) {
      PowerRing( 20.98, thickness, depth, beveled );
    }
    if ( size == "X" ) {
      PowerRing( 21.18, thickness, depth, beveled );
    }
    if ( size == "X.5" ) {
      PowerRing( 21.39, thickness, depth, beveled );
    }
    if ( size == "Y" ) {
      PowerRing( 21.59, thickness, depth, beveled );
    }
    if ( size == "Z" ) {
      PowerRing( 21.79, thickness, depth, beveled );
    }
    if ( size == "Z.5" ) {
      PowerRing( 22.00, thickness, depth, beveled );
    }
    if ( size == "Z1" ) {
      PowerRing( 22.40, thickness, depth, beveled );
    }
    if ( size == "Z2" ) {
      PowerRing( 22.81, thickness, depth, beveled );
    }
    if ( size == "Z3" ) {
      PowerRing( 23.01, thickness, depth, beveled );
    }
    if ( size == "Z4" ) {
     PowerRing( 23.42, thickness, depth, beveled );
    }
  }
  if ( region == 2 ) {
    if ( size == 1 ) {
      PowerRing( 12.45, thickness, depth, beveled );
    }
    if ( size == 2 ) {
      PowerRing( 13.26, thickness, depth, beveled );
    }
    if ( size == 3 ) {
      PowerRing( 13.67, thickness, depth, beveled );
    }
    if ( size == 4 ) {
      PowerRing( 14.07, thickness, depth, beveled );
    }
    if ( size == 5 ) {
      PowerRing( 14.27, thickness, depth, beveled );
    }
    if ( size == 6 ) {
      PowerRing( 14.68, thickness, depth, beveled );
    }
    if ( size == 7 ) {
      PowerRing( 14.88, thickness, depth, beveled );
    }
    if ( size == 8 ) {
      PowerRing( 15.29, thickness, depth, beveled );
    }
    if ( size == 9 ) {
      PowerRing( 15.70, thickness, depth, beveled );
    }
    if ( size == 10 ) {
      PowerRing( 16.10, thickness, depth, beveled );
    }
    if ( size == 11 ) {
      PowerRing( 16.51, thickness, depth, beveled );
    }
    if ( size == 12 ) {
      PowerRing( 16.71, thickness, depth, beveled );
    }
    if ( size == 13 ) {
      PowerRing( 16.92, thickness, depth, beveled );
    }
    if ( size == 14 ) {
      PowerRing( 17.32, thickness, depth, beveled );
    }
    if ( size == 15 ) {
      PowerRing( 17.73, thickness, depth, beveled );
    }
    if ( size == 16 ) {
      PowerRing( 18.14, thickness, depth, beveled );
    }
    if ( size == 17 ) {
      PowerRing( 18.54, thickness, depth, beveled );
    }
    if ( size == 18 ) {
      PowerRing( 18.95, thickness, depth, beveled );
    }
    if ( size == 19 ) {
      PowerRing( 19.35, thickness, depth, beveled );
    }
    if ( size == 20 ) {
      PowerRing( 19.76, thickness, depth, beveled );
    }
    if ( size == 21 ) {
      PowerRing( 19.96, thickness, depth, beveled );
    }
    if ( size == 22 ) {
      PowerRing( 20.17, thickness, depth, beveled );
    }
    if ( size == 23 ) {
      PowerRing( 20.57, thickness, depth, beveled );
    }
    if ( size == 24 ) {
      PowerRing( 20.98, thickness, depth, beveled );
    }
    if ( size == 25 ) {
      PowerRing( 21.39, thickness, depth, beveled );
    }
    if ( size == 26 ) {
      PowerRing( 21.79, thickness, depth, beveled );
    }
    if ( size == 27 ) {
      PowerRing( 22.20, thickness, depth, beveled );
    }
  }
  if ( region == 3 ) {
    if ( size == 1.5 ) {
      PowerRing( 13.26, thickness, depth, beveled );
    }
    if ( size == 2.75 ) {
      PowerRing( 13.67, thickness, depth, beveled );
    }
    if ( size == 4 ) {
      PowerRing( 14.07, thickness, depth, beveled );
    }
    if ( size == 5.25 ) {
      PowerRing( 14.27, thickness, depth, beveled );
    }
    if ( size == 6.5 ) {
      PowerRing( 14.68, thickness, depth, beveled );
    }
    if ( size == 7.75 ) {
      PowerRing( 15.09, thickness, depth, beveled );
    }
    if ( size == 9 ) {
      PowerRing( 15.49, thickness, depth, beveled );
    }
    if ( size == 10 ) {
      PowerRing( 15.90, thickness, depth, beveled );
    }
    if ( size == 11.75 ) {
      PowerRing( 16.31, thickness, depth, beveled );
    }
    if ( size == 12.75 ) {
      PowerRing( 16.51, thickness, depth, beveled );
    }
    if ( size == 14 ) {
      PowerRing( 16.92, thickness, depth, beveled );
    }
    if ( size == 15.25 ) {
      PowerRing( 17.32, thickness, depth, beveled );
    }
    if ( size == 16.5 ) {
      PowerRing( 17.73, thickness, depth, beveled );
    }
    if ( size == 17.75 ) {
      PowerRing( 18.14, thickness, depth, beveled );
    }
    if ( size == 19 ) {
      PowerRing( 18.75, thickness, depth, beveled );
    }
    if ( size == 20.25 ) {
      PowerRing( 19.15, thickness, depth, beveled );
    }
    if ( size == 21.5 ) {
      PowerRing( 19.56, thickness, depth, beveled );
    }
    if ( size == 22.75 ) {
      PowerRing( 20.17, thickness, depth, beveled );
    }
    if ( size == 25 ) {
      PowerRing( 20.78, thickness, depth, beveled );
    }
    if ( size == 27.5 ) {
      PowerRing( 21.39, thickness, depth, beveled );
    }
    if ( size == 28.75 ) {
      PowerRing( 21.79, thickness, depth, beveled );
    }
  }
}

module PowerRing ( diameter, thick, depth, bevel )
{
  rotate( a = [ 0, 0, 90 ] )
  {
    difference()
    {
      union ()
      {
        translate ( v = [0,-2.5,0] )
        cube( [ ( diameter / 2 ) + 5, diameter + 10, thick], center = false );
        translate( v = [ ( diameter / 2 ) + 5, ( diameter / 2 ) + 2.5, ] )
        cylinder( h = thick, r = ( diameter / 2 ) + 5 );
      }
     translate( v = [(diameter / 2) + 5,(diameter / 2) + 2.5,-1 ] )
     cylinder(h=thick+2,r=diameter / 2);
    
	translate( v = [-1,(diameter / 2) + 2.5,thick / 2] )
    rotate ( a = [90,0,0])  
	TearDrop(thick / 3,depth + 1);
     if (bevel)
      {
        translate ( v = [0,(diameter / 2)+2.5,0] )
        rotate ( a = [0,45,0])
        cube([3,diameter + 20,3],center = true);
        translate ( v = [0,(diameter / 2)+2.5,thick] )
        rotate ( a = [0,45,0])
        cube([3,diameter + 20,3],center = true);
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