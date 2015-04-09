//---------------------------------------------------------------
//-- Another compartment box, by Obijuan  (Juan Gonzalez-Gomez)
//-- (c) April, 2013
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------
//-- It is a design derived from:
//--   http://www.thingiverse.com/thing:15802  by ttsalo
//---------------------------------------------------------------

X = 0;
Y = 1;
Z = 2;


//-- Cabinet parameters -------------------------------

//-- Rhombus parameters
alpha = 60;    //-- Rhombus Side angle
rx = 8;        //-- Rhombus x length

cab_size = [80, 120, 80];
cab_th = 4;
cab_botton = 10;


//-- Handle parameters
handle_size = [drawer_size[X]/3, 12, drawer_size[Z]/2];
handle_th = 3;

//---------------------------------
//-- A rhombus
//---------------------------------
module rhombus(ang=60, rx=20, h=3)
{

  x = rx;
  y = x*tan(ang);

/*  translate([0, 0, -h/2])
  linear_extrude(height=h)
  polygon([[-x,0], [0,y], [x,0], [0, -y]]);*/
 inner = [x, x, h];

 union(){
 	cube(inner, center=true);
	rotate([0,0,45])cube(inner, center=true);
	}
}

//---------------------------------
//-- A rhombus
//---------------------------------
module star(ang=60, rx=20, h=3)
{

  x = rx/2;
  y = x*tan(ang);
 inner = [x, x, h];

 union(){
 	cube(inner, center=true);
	rotate([0,0,45])cube(inner, center=true);
	}
}

//--------------------------------------
//-- A mosaic of rhombus
//-- INPUTS:
//--   L = x length of the area
//--   H = y length of the area
//--   rx: rhombus x length
//--   alpha: rhombus side angle
//--   rth: rhombus thickness
//--------------------------------------
module mosaic(L, H, rx, alpha, rth)
{

  //-- x distance between two adjacent rhombuses
  //l = rx+6;
l = rx*5/2;

  //-- y distance between two rows of rhombuses
  h = l/3 * tan(alpha);

  //-- Calculate the number of rhombuses along the x and y axis
  nrx = round((L-l/2)/l);
  nry = round((H-h)/h);

  //-- Calculate the dimension of the mosaic, according to the
  //-- number of rhombuses (columns and rows)
  H2 = h * (nry-1);
  L2 = (nrx-1) * l + rx;

  //-- Draw the mosaic
  color("green")
  translate([-L2/2 + rx/2, -H2/2, 0])  //-- center the mosaic
  for (j=[0:nry-1]) {  //-- Rows...

    for (i=[0:nrx-1-(j%2)]) {  //-- Columns
      translate([i*l + (j%2)*l/2 ,j*h,0])
        rhombus(alpha,rx, rth);
    }
  }
}

module cabinet()
{
  inner = [cab_size[X] - 2*cab_th, cab_size[Y], cab_size[Z] - 2*cab_th];

  union() {


  difference() {

    //-- Main cabinet
    cube(cab_size, center= true);

    //-- Inner room
    translate([0, cab_botton, 0])
    cube(inner, center=true);
    


    //-- Top and bottom mosaics
    mosaic(L = cab_size[X], 
           H = cab_size[Y]-cab_botton, 
           rx = rx, 
           alpha = alpha, 
           rth = cab_size[Z]+10);

     //-- Left and right mosaics
     rotate([0, 90, 0])
       mosaic(L = cab_size[Z], 
              H = cab_size[Y]-cab_botton, 
              rx = rx, 
              alpha = alpha, 
              rth = cab_size[X] + 10);


  }

    
  }
}





//-- Uncomment the part you want to generate


//--- Cabinet
//-- rotation, for making it printable
//rotate([90,0,0])
  cabinet();
//rhombus();
//star();
