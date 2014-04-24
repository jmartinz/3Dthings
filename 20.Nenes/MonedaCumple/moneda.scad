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

translate([-45,-45,0])moneda("MAS");
translate([-45,-15,0])moneda("NBT");
translate([-45,15,0])moneda("LJM");
translate([-45,45,0])moneda("PLC");
translate([-15,-45,0])moneda("IDV");
translate([-15,-15,0])moneda("DDS");
translate([-15,15,0])moneda("VDJ");
translate([-15,45,0])moneda("JEM");
translate([15,-45,0])moneda("JFR");
translate([15,-15,0])moneda("PGB");
translate([15,15,0])moneda("MGG");
translate([15,45,0])moneda("JGN");
translate([45,-45,0])moneda("OGI");
translate([45,-15,0])moneda("GMS");
translate([45,15,0])moneda("DMM");
translate([45,45,0])moneda("CMM");
