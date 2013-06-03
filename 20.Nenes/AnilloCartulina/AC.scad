use <WriteSVG.scad>

nombre="Gonzalo";
// Aro
module aro(grosor_aro=11,  diam_ext=70, diam_int = 60, texto = nombre)
{
 // Exterior Aro
 difference(){
    cylinder(r=diam_ext/2,h=grosor_aro,  $fn=100);
    //-- Taladro aro
   cylinder(r=diam_int/2, h=grosor_aro*3,$fn=100,center=true);
 }
	//Letras
	translate([0,0,0.75])writecylinder(texto,[0,0,0],diam_ext/2,grosor_aro);

}

aro();

