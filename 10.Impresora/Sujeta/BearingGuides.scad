//---------------------------------------------------------------------
//  Spool holder for Prusa i3 with 6mm aluminium Frame   
//  (c)iPadNanito <@iPadNanito> , March-2013                        
//---------------------------------------------------------------------

bearing_exterior = 22;
bearing_interior = 12;
bearing_width = 7;

module bearing_support()
{
	difference()
	{
		difference()
		{
			cube([26,16, 25], center = true); // Piece body
			
			translate([0,0.25,-6])
			#cube([15,15.5,6.8], center = true); // Hole where inserts M8 nut 
		}

		translate([0,0,9.25])
		rotate([90,90,0])
		bearing_with_rod();  // Hole for the bearing with the threaded rod

		translate([0,0,-15])
		cylinder(r=8/2, h=20, $fn=100, center = true); // M8 hole for threaded rod

	}
}

module bearing_with_rod()
{
		color("grey")
		cylinder(r=bearing_exterior/2, h=bearing_width, $fn=150, center=true); // Bearing body

		cylinder(r=bearing_interior/2, h=bearing_width+40, $fn=150, center=true); // M8 threaded rod
}

bearing_support();
translate([0,25,0]) bearing_support();