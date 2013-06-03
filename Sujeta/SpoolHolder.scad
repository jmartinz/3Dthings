//---------------------------------------------------------------------
//  Spool holder for Prusa i3 with 6mm aluminium Frame   
//  (c)iPadNanito <@iPadNanito> , March-2013                        
//---------------------------------------------------------------------

nut_diam = 6.5;  // M3 Nut diameter
screw_diam = nut_diam/2; // Nut hole for screw diameter

module frame_support()
{
	difference()
	{
		difference()
		{
	
			difference()
			{
	
				difference() 
				{
					cube([14,20,60], center = true); // Piece body
					translate([0,0,-8.5])
					cube([6,22,50], center = true);  // Hole where inserts the aluminium frame
				}

				translate([1,0,30])
				cylinder(r=8/2, h=20, $fn=100, center = true); // M8 hole for threaded rod
			}
	
			translate([1,0,21])
			cube([14,15.5,6.25], center = true); // Hole where inserts M8 nut 
		}
		
		translate([6.1,4,-26])
		nut(); // M3 nut 1

		rotate([0,90,0]) translate([26,4,0])
		cylinder(r=screw_diam/2, h=50, $fn=50, center = true); // Nut hole for screw 1

		translate([6.1,-4,-26])
		nut(); // M3 nut 2

		rotate([0,90,0]) translate([26,-4,0])
		cylinder(r=screw_diam/2, h=50, $fn=50, center = true); // Nut hole for screw 2
	}
}
rotate([90,0,90]) frame_support();
//translate([0,30,0])rotate([90,0,90]) frame_support();