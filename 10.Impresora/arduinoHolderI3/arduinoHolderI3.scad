// from http://www.thingiverse.com/thing:107068
module example003()
{
	difference() {
		union() {
			translate([0,0,0]) {
				cube([24, 60.5, 10]);
			}
		}


			translate([1.5,2.5,-1]) {
				  cube([6.5, 55.5, 15]);
			}
			translate([-5,3.5,-1]) {
				cube([11, 54, 15]);
			}

			translate([18,3.5,-1]) {
				cube([3, 54, 15]);
			}

			translate([15,5,-1]) {
				cube([15, 51, 15]);
			}

	}
}

example003();

