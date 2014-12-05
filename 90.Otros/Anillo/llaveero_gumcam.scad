
//Gumcam(15,3);


module Gumcam(radius,depth)
{
	scale([radius/28,radius/28,1])
	//rotate(a = [0,90,0])
	linear_extrude(height = depth)
	import("GUMCAMv3.dxf");
}

//-- Cilindro normal. r es el radio, h es la altura
module redondo(){
rad = 20;
difference() {

	cylinder (r = rad, h = 3, $fn = 100);
	translate([0,rad -4, -10])
	cylinder (r = 1.5, h = 20, $fn = 100);
}
}
module cuad_red(lx,ly,r,h){
//-- Parametros de la caja
/*lx = 40; //-- Longitud en eje x
ly = 40; //-- Longitud en eje y
r = 5; //-- Radio del redondeo de las esquinas
h = 3; //-- Altura*/
h=h/2;
//-- Coordenadas del cilindro del primer cuadrante
cx = lx/2 - r;
cy = ly/2 - r;

//-- Posicion de los 4 cilindros de las esquinas
P1 = [cx, cy, 0];
P2 = [-cx, cy, 0];
P3 = [-cx, -cy, 0];
P4 = [cx, -cy, 0];
 

//-- Obtener el menor objeto convexo que contiene
//-- los 4 cilindros
hull() {
  translate(P1)
    cylinder(r = r, h = h, center = true, $fn = 20);
   
  translate(P2)
    cylinder(r = r, h = h, center = true, $fn = 20);
   
  translate(P3)
    cylinder(r = r, h = h, center = true, $fn = 20);
   
  translate(P4)
    cylinder(r = r, h = h, center = true, $fn = 20);
}


}
module base(dim,h){
difference() {
cuad_red(dim,dim,4,h);
	translate([-dim/2+3,dim/2-3, -10])
	cylinder (r = 1.5, h = 20, $fn = 100);
}
}


module llavero(dim,h){
union(){
	color ("red")base(dim,h);
	translate([-8,-5, h/4])
	Gumcam(dim/3,h/3*2);
}

}

llavero(35,3);