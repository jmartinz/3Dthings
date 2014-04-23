// Fusito v2.0
// http://clonewars.es
//
// based on William Adams' excellent ball-and-socket code
use <WriteSVG.scad>

iniciales = "GMS";

module moneda(texto = iniciales)
{
	altura = 3;
	difference(){
		cylinder(r=23.25/2, h=2.3, $fn=60);

		translate([0,0,altura/2+1])write(texto,t=altura,h=8, center=true);
		translate([0,7.5,0])cylinder(r=3/2, h=6, $fn=8,center=true);
	}

}

translate([15,15,0])moneda("GMS");
translate([15,-15,0])moneda("JGN");
translate([-15,15,0])moneda("PGB");
translate([-15,-15,0])moneda("PLC");