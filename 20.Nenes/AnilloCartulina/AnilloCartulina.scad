use <WriteSVG.scad>


// Aro
module aro(grosor_aro=10,  diam_ext=58, diam_int = 50, texto = "Gonzalo")
{
 // Exterior Aro
 difference(){
    cylinder(r=diam_ext/2,h=grosor_aro,  $fn=100);
    //-- Taladro aro
   cylinder(r=diam_int/2, h=grosor_aro*3,$fn=100,center=true);
 }
	//Letras
	writecylinder(texto,[0,0,0],diam_ext/2,grosor_aro);

}

aro();

