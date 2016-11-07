// Fusito v2.0
// http://clonewars.es
//
// based on William Adams' excellent ball-and-socket code
use <WriteSVG.scad>

iniciales = "GMS";

module moneda(texto = iniciales,h=8)
{
	altura = 3;
	difference(){
		cylinder(r=23.25/2, h=2.3, $fn=60);

		translate([0,0,altura/2+1])write(texto,t=altura,h=h, center=true);
		translate([0,7.5,0])cylinder(r=3/2, h=6, $fn=8,center=true);
	}

}

translate([-45,-45,0])moneda("MPS");
translate([-45,-15,0])moneda("RPP");
translate([-45,15,0])moneda("IPM");
translate([-45,45,0])moneda("ARA");
translate([-15,-45,0])moneda("MRM");
translate([-15,-15,0])moneda("PRU");
translate([-15,15,0])moneda("ORW");
translate([-15,45,0])moneda("HSG");
translate([15,-45,0])moneda("RSA");
translate([15,-15,0])moneda("SVM");
translate([15,15,0])moneda("OWC");
translate([15,45,0])moneda("MJCG",h=7);

