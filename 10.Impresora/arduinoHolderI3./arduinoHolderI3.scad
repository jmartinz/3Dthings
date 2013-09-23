// from http://www.thingiverse.com/thing:107068
module example003()
{
	difference() {
		union() {
			translate([0,1,0]) {
				cube([24, 58.5, 10]);
			}
		}


			translate([1.5,3,-1]) {
				cube([6.5, 54.5, 15]);
			}
			translate([-5,4.5,-1]) {
				cube([11, 52, 15]);
			}

			translate([18,3.5,-1]) {
				cube([3, 53.5, 15]);
			}

			translate([15,5,-1]) {
				cube([15, 51, 15]);
			}

	}
}

example003();

