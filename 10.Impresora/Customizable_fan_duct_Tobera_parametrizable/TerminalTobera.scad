/*****************************************************************************************************************/
/*	DESCRIPCION: 	Libreria con los módulos necesarios para generar el terminal de la	*/
/*				tobera.										*/
/*				Módulos para elementos geométricos diversos.				*/
/*	AUTOR:		Dracnas										*/
/*	CONTACTO:		dracnas2014@gmail.com							*/
/*	FECHA:		01/09/2014										*/
/*	LICENCIA:		GNU GPL V3									*/
/*****************************************************************************************************************/

include <Configuracion.scad>
use <libreria.scad>

module TipoTobera()
//Determina la forma de la salida inferior de la tobera
//Tipo=0 sin salida
//Tipo=1 salida completa
//Tipo=2 salida con taladros
{
 if(TIPOSALIDA==1)
 {
  translate([0,0,-2*(RE-RI)])
  difference()
  {
   cylinder(h=2*(RE-RI),r=RE-GPT,$fn=Resolucion);
   cylinder(h=10*RE-RI,r=RI+GPT,$fn=Resolucion);
  }
 }
if(TIPOSALIDA==2)
 {
  translate([0,0,-2*(RE-RI)])
  for(i=[2:4])
	{
	rotate([0,0,-i*180/6])
	 translate([RI+(RE-RI)/2,0,0])
	 cylinder(h=2*(RE-RI),r=(RE-RI-2*GPT)/2,$fn=Resolucion);
	}
 }
}


module TerminalTobera()
//Crea el terminal de la tobera
{
 union()
 {
  difference()
  {
   toroide(RI,RE);
   translate([0,0,(RE-RI)/2])  rotate([-45,0,0])  translate([0,RE,0])  cube([2*RE,2*RE,2*RE],center=true);
 } 
  difference()
  {
   hull()
   {
     translate([-RE+(RE-RI)/2,0,0])   	rotate([90,0,0])   cylinder(h=RE-(RE-RI)/2,r=(RE-RI)/2,$fn=Resolucion);
     translate([RE-(RE-RI)/2,0,0]) 	rotate([90,0,0])   cylinder(h=RE-(RE-RI)/2,r=(RE-RI)/2,$fn=Resolucion);
   } 
   cylinder(r=RI+(RE-RI)/2,h=2*(RE-RI),center=true,$fn=Resolucion);
   translate([0,0,(RE-RI)/2])  rotate([-45,0,0])  translate([0,RE,0])  cube([2*RE,2*RE,2*RE],center=true);
  }  
}
}
module InteriorTerminalTobera()
{
 union()
 {
    toroide(RI+GPT,RE-GPT);
    difference()
      {
  	hull()
  	{
  	  translate([-RE+(RE-RI)/2,0,0])   rotate([90,0,0])   cylinder(h=RE-(RE-RI)/2,r=(RE-RI)/2-GPT,$fn=Resolucion);
   	  translate([RE-(RE-RI)/2,0,0])     rotate([90,0,0])   cylinder(h=RE-(RE-RI)/2,r=(RE-RI)/2-GPT,$fn=Resolucion);
 	 } 
  	cylinder(r=RI+(RE-RI)/2,h=2*(RE-RI),center=true,$fn=Resolucion);
     } 
  
 }
}


