/*****************************************************************************************************************/
/*	DESCRIPCION: 	Libreria con modulos para generar los soportes de la tobera		*/
/*				tanto el soporte del ventilador, como el soporte del conjunto total	*/
/*															*/
/*	AUTOR:		Dracnas										*/
/*	CONTACTO:		dracnas2014@gmail.com							*/
/*	FECHA:		01/09/2014										*/
/*	LICENCIA:		GNU GPL V3									*/
/*****************************************************************************************************************/

include <Configuracion.scad>
use <libreria.scad>

module SoportePpal()
{
  hull()
  {
   translate([+DIM[TAM][2]/2-2*GPS-SAM,-FT-RE+(RE-RI)/2+(DIM[TAM][1]+2*GP)*cos(ANV)/2-GP*cos(90-ANV)/2,DT+(DIM[TAM][1]+2*GP)*sin(ANV)/2+GP*sin(90-ANV)/2-GP]) 
   cube([2*GPS+SAM,0.1,GP]);
   translate([DSX1,	(-FT-RE+(RE-RI)/2+(DIM[TAM][1]+2*GP)*cos(ANV)/2-GP*cos(90-ANV)/2)+((DSZ1-GPS-(RE-RI)/2)-(DT+(DIM[TAM][1]+2*GP)*sin(ANV)/2+GP*sin(90-ANV)/2-GP))/tan(ANV),DSZ1-GPS/2-(RE-RI)/2]) 
   cube([2*GPS+SAM,0.1,GPS],center=true);
  }
  hull()
  {
   translate([-DIM[TAM][2]/2,-FT-RE+(RE-RI)/2+(DIM[TAM][1]+2*GP)*cos(ANV)/2-GP*cos(90-ANV)/2,DT+(DIM[TAM][1]+2*GP)*sin(ANV)/2+GP*sin(90-ANV)/2-GP]) 
   cube([2*GPS+SAM,0.1,GP]);
   translate([DSX2,	(-FT-RE+(RE-RI)/2+(DIM[TAM][1]+2*GP)*cos(ANV)/2-GP*cos(90-ANV)/2)+((DSZ2-GPS-(RE-RI)/2)-(DT+(DIM[TAM][1]+2*GP)*sin(ANV)/2+GP*sin(90-ANV)/2-GP))/tan(ANV),DSZ2-GPS/2-(RE-RI)/2]) 
  cube([2*GPS+SAM,0.1,GPS],center=true);
  }
  
 difference()
 {
  hull()
  {
   translate([DSX1,DSY1,DSZ1-GPS/2-(RE-RI)/2])  cube([2*GPS+SAM,2*GPS+SAM,GPS],center=true);
   translate([DSX1,(-FT-RE+(RE-RI)/2+(DIM[TAM][1]+2*GP)*cos(ANV)/2-GP*cos(90-ANV)/2)+((DSZ1-GPS-(RE-RI)/2)-(DT+(DIM[TAM][1]+2*GP)*sin(ANV)/2+GP*sin(90-ANV)/2-GP))/tan(ANV),DSZ1-GPS/2-(RE-RI)/2]) 
   cube([2*GPS+SAM,0.1,GPS],center=true);
  }
  translate([DSX1,DSY1,DSZ1-GPS/2-(RE-RI)/2]) cylinder(h=2*GPS,r=SAM/2,center=true,$fn=Resolucion);
 }
 difference()
 {
  hull()
 {
  translate([DSX2,DSY2,DSZ2-GPS/2-(RE-RI)/2])   cube([2*GPS+SAM,2*GPS+SAM,GPS],center=true);
  translate([DSX2,(-FT-RE+(RE-RI)/2+(DIM[TAM][1]+2*GP)*cos(ANV)/2-GP*cos(90-ANV)/2)+((DSZ2-GPS-(RE-RI)/2)-(DT+(DIM[TAM][1]+2*GP)*sin(ANV)/2+GP*sin(90-ANV)/2-GP))/tan(ANV),DSZ2-GPS/2-(RE-RI)/2]) 
  cube([2*GPS+SAM,0.1,GPS],center=true);
 }
 translate([DSX2,DSY2,DSZ2-GPS/2-(RE-RI)/2]) cylinder(h=2*GPS,r=SAM/2,center=true,$fn=Resolucion);
 }
}
module EspacioTuercas()
//Este módulo crea un espacio para colocar las tuercas
{
 VE=DIM[TAM][0];			//DIAMETRO VENTILADOR
 VEH=DIM[TAM][1];			//DIAMETRO HUECO VENTILADOR
 VDA=DIM[TAM][2];			//DISTANCIA ENTRE AGUJEROS
 MTU=DIM[TAM][3];			//METRICA DE LA TUERCA
 GPT=DIM[TAM][4];			//GROSOR PARED TUERCA
translate([0,-FT-RE+(RE-RI)/2,DT])  rotate([ANV,0,0]) 
{
  //Agujeros Metrica 3
    translate([ VDA/2, VDA/2,0])   cylinder(h=8*GP,r=1.5,$fn=20,center=true);
    translate([-VDA/2,-VDA/2,0])  cylinder(h=8*GP,r=1.5,$fn=20,center=true);
    translate([-VDA/2, VDA/2,0])  cylinder(h=8*GP,r=1.5,$fn=20,center=true);
    translate([ VDA/2,-VDA/2,0])  cylinder(h=8*GP,r=1.5,$fn=20,center=true);
   translate([ VDA/2, VDA/2,-GP/2])   scale([1,1,2]) TuercaN(MTU);
   translate([-VDA/2,-VDA/2,-GP/2])  scale([1,1,2]) TuercaN(MTU);
   translate([ VDA/2,-VDA/2,-GP/2])  scale([1,1,2]) TuercaN(MTU);
   translate([-VDA/2, VDA/2,-GP/2])  scale([1,1,2]) TuercaN(MTU);
}
}

module SoporteVentilador()
//Este módulo crea una superficie plana perforada y
//con soporte para las tuercas a la que se atornilla el ventilador
{
 translate([0,-FT-RE+(RE-RI)/2,DT])
 rotate([ANV,0,0])
 difference()
 {
  union()
  {
   difference()
   {
    cubosemiredondeado(DIM[TAM][1]+2*GP,DIM[TAM][1]+2*GP,GP,5,fn=Resolucion);
    //Agujeros Metrica 3
    translate([ DIM[TAM][2]/2, DIM[TAM][2]/2,0])   cylinder(h=2*GP,r=1.5,$fn=20,center=true);
    translate([-DIM[TAM][2]/2,-DIM[TAM][2]/2,0])  cylinder(h=2*GP,r=1.5,$fn=20,center=true);
    translate([-DIM[TAM][2]/2, DIM[TAM][2]/2,0])  cylinder(h=2*GP,r=1.5,$fn=20,center=true);
    translate([ DIM[TAM][2]/2,-DIM[TAM][2]/2,0])  cylinder(h=2*GP,r=1.5,$fn=20,center=true);
   }
   translate([ DIM[TAM][2]/2, DIM[TAM][2]/2,-GP/2])  PortaTuerca(DIM[TAM][3],DIM[TAM][4]);
   translate([-DIM[TAM][2]/2,-DIM[TAM][2]/2,-GP/2])  PortaTuerca(DIM[TAM][3],DIM[TAM][4]);
   translate([ DIM[TAM][2]/2,-DIM[TAM][2]/2,-GP/2])  PortaTuerca(DIM[TAM][3],DIM[TAM][4]);
   translate([-DIM[TAM][2]/2, DIM[TAM][2]/2,-GP/2])  PortaTuerca(DIM[TAM][3],DIM[TAM][4]);
  }
  cylinder(h=8*GP,r=DIM[TAM][1]/2,$fn=Resolucion,center=true);
 }
}
module RecorteVentilador()
//Este modulo recorta el cono de la tobera porque al hacer el hull sobre las primeras secciones (que al curvarse sobresalen un poco)
//Es simplemente para eliminar una rebaba antiestetica
{
 translate([0,-FT-RE+(RE-RI)/2,DT])
 rotate([ANV,0,0])
 difference()
   {
    cube([DIM[TAM][1]+4*GP,DIM[TAM][1]+4*GP,GP],center=true);
    cubosemiredondeado(DIM[TAM][1]+2*GP,DIM[TAM][1]+2*GP,20*GP,5,fn=Resolucion);
   }
}