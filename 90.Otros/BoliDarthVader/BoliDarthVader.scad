

difference(){
	union(){
 		scale([0.4,0.4,0.4])import("DarthTuri.STL");
 		//translate([-5,-7,0])cube(10);
	}
	//
}
cylinder( h =20,r=8.2/2, center=true);
//-------- USER PARAMETERS -----------------------------
//-- Change these parameters for configuring your
//-- own marble organizer

//-- The organizer is an array of N x N barbles
N = 20;

//-- Marble diameter
md = 0.5;

//-- Distance between marbles
d = 1;

//-- box bottom height. The box is at least md/2 in height
//-- With this parameter you can increase the distance from
//-- the boxs bottom to the marble's bottom
bottom_h = 1;

//--------------------------------------------

//-- Distance between the marble's centers
dc = md + d;

//-- Marble array size (for centering)
size = (N-1) * dc;    

//-- Marble box size
size_box = N * dc;

//-- Marble box height
h_box = md / 2 + bottom_h;



  //-- Array of marbles
  color("red") translate([-size / 2, -size / 2, 0])  //-- center the array
  for (ix = [0:N-1])    
    for (iy = [0:N-1]) 
      translate([ix, iy, 0] * dc)
	sphere(r = md/2, $fn=20);
