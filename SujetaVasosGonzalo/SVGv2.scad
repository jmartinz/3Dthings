/* NOTES:
	writecylinder(text="text",where=[0,0,0],radius=20,height=40);
	
	Required Parameters (If supplied in this order, identifier is not required)
		text="text"	 	: Text to be written
		where=[x,y,z]	: coordinates of cylinder
		radius=mm 		: radius of cylinder
		height=mm 		: height of cylinder

	Optional Parameter:
		center=boolean :	use this to specify that cylinder is centered on coordinates
					(default is center=false)
		face="top" : Top of cylinder
		face="bottom": bottom of cylinder
		face="front" :barrel of cylinder (default if not supplied)	

	Optional Parameters: (face is not "top" or "bottom")
		east=degrees : west= degrees: (moves text east or west around z)
		up=mm or down=mm : moves text up or down along Z axis
		rotate=degrees : rotates text around Y axis (spirals around cylinder)
	
	Optional Parameters: (face="top" or face="bottom")
		east=degrees or west=degrees : rotate text east or west around top
		rotate=degrees : (similar to east west but not dependant on text orientation)
		ccw=boolean : If true, writes in a counter clockwise direction. (default=false)
		middle=mm :moves the text ?mm toward center of top or bottom surface 	

*/

use <WriteSVG.scad>


 //-- Parmetros del vaso
/* grosor = 20;
 diam_ext=80;
 diam_int = 63.3; 
 texto = "Gonzalo";
diam_tubo = 60;
*/

// Aro
module aro(grosor_aro=20,  diam_ext=80, diam_int = 63.3, texto = "Gonzalo")
{
 // Exterior Aro
 difference(){
  difference() {
     //-- Base de la rueda
    cylinder(r=diam_ext/2,h=grosor_aro,  $fn=100);
	rotate([0,180,-90])
	translate([0,0,-20])
    	writecylinder(texto,[0,0,0],diam_ext/2-0.7,grosor_aro);
   } 

    //-- Taladro aro
   cylinder(r1=diam_int/2+5, r2=diam_int/2-5,h=grosor_aro*3,$fn=100,center=true);
 }
}

//Base asa
module base_asa(altura=40, diam_int = 63.3, diam_ext=80, diam_tubo = 60)
{
difference(){
difference(){
 translate([diam_int/2,-20,0])
 cube([30,40,altura]);

translate([(diam_ext+diam_tubo)/2+5,0,altura/2])
  cylinder(r=diam_tubo/2, h=altura*2,$fn=100,center=true);
}

translate([14,21,48])
rotate([90,0,0])
cylinder(r=60/2,h=42,  $fn=100);
}
}

//Cuerpdel soporte del vaso
module cuerpo_sv(grosor_aro=20,  diam_ext=80, diam_int = 63, texto = "Gonzalo",altura=40, diam_tubo = 60.34){
 aro(grosor_aro,  diam_ext, diam_int, texto);
 base_asa(altura, diam_int, diam_ext, diam_tubo);
}

module agarradera( diam_ext=80, diam_int = 63.3, altura_ag=12, ancho_ag=2, diam_tubo = 60){
difference(){
  	translate([(diam_ext+diam_tubo)/2+3,0,0])
	cylinder(r=diam_tubo/2+ancho_ag, h=altura_ag,$fn=100);

  	translate([(diam_ext+diam_tubo)/2+3,0,-altura_ag*2])
	cylinder(r=diam_tubo/2, h=altura_ag*4,$fn=100);
}
}

module agarraderas( altura_asa=40, diam_ext=80, diam_int = 63.3, altura_ag=12, ancho_ag=2, diam_tubo = 60){
separacion=(altura_asa-altura_ag*2)/3;
translate([0,0,separacion])
agarradera(diam_ext, diam_int , altura_ag, ancho_ag, diam_tubo );

translate([0,0,separacion*2+altura_ag])
agarradera(diam_ext, diam_int , altura_ag, ancho_ag, diam_tubo );

}

module soporte_vaso(){
	difference(){	
		cuerpo_sv();
		agarraderas();
	}
}
/*difference(){	
soporte_vaso();
color("Red")
translate([14,21,48])
rotate([90,0,0])
cylinder(r=60/2,h=42,  $fn=100);
}*/

soporte_vaso();





