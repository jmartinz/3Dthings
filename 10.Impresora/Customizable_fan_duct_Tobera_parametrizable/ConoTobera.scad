/*****************************************************************************************************************/
/*	DESCRIPCION: 	Libreria con los módulos necesarios para crear un cono sin base	*/
/*				ni tapa y de interior hueco.							*/
/*															*/
/*	AUTOR:		Dracnas										*/
/*	CONTACTO:		dracnas2014@gmail.com							*/
/*	FECHA:		01/09/2014										*/
/*	LICENCIA:		GNU GPL V3									*/
/*****************************************************************************************************************/

include  <Configuracion.scad>
use <libreria.scad>

module ConoTobera()
//Crea el cono de la tobera como union de las secciones definidas en cada submodulo
{
  union()
  {
   //INICIO
    hull()
   {
    translate([0,-FT-RE+(RE-RI)/2,DT])  rotate([ANV,0,0])   cylinder(h=0.0001,r=(DIM[TAM][1]+2*GP)/2,$fn=Resolucion);
    SeccionTobera(1);
   }
   //MEDIO
   for(i=[1:Resolucion-2])
   {
    hull()
     {
      SeccionTobera(i);
      SeccionTobera(i+1);
     }
   }
  //FINAL
  hull()
  {
   SeccionTobera(Resolucion-2);
   hull()
    {
     translate([-RE+(RE-RI)/2,-RE+(RE-RI)/2,0])	rotate([90,0,0]) 	cylinder(h=0.0001,r=(RE-RI)/2,$fn=Resolucion);
     translate([RE-(RE-RI)/2,-RE+(RE-RI)/2,0])		rotate([90,0,0])  	cylinder(h=0.0001/2,r=(RE-RI)/2,$fn=Resolucion);
    } 
  }
 }
}
module InteriorConoTobera()
//Crea el cono de la tobera como union de las secciones definidas en cada submodulo
{
  union()
  {
   //INICIO
    hull()
   {
    translate([0,-FT-RE+(RE-RI)/2,DT])    rotate([ANV,0,0])    cylinder(h=0.01,r=(DIM[TAM][1])/2,$fn=Resolucion);
    SeccionToberaInterior(1);
   }
   //MEDIO
   for(i=[1:Resolucion-2])
   {
    hull()
     {
      SeccionToberaInterior(i);
      SeccionToberaInterior(i+1);
     }
   }
  //FINAL
  hull()
  {
   SeccionToberaInterior(Resolucion-2);
   hull()
    {
     translate([-RE+(RE-RI)/2,-RE+(RE-RI)/2,0])	rotate([90,0,0]) 	cylinder(h=0.0001,r=(RE-RI)/2-GPT,$fn=Resolucion);
     translate([RE-(RE-RI)/2,-RE+(RE-RI)/2,0])		rotate([90,0,0])  	cylinder(h=0.0001/2,r=(RE-RI)/2-GPT,$fn=Resolucion);
    } 
  }
 }
}
module SeccionTobera(__i)
//Este módulo crea una porción de la tobera de grosor La longitud de la tobera/ Resolución
//Tiene la peculiaridad de ser parametizable y se genera con un radio de curvartura determinado 
{
 hull()
{
 translate([0,
	       -((Resolucion-__i)*FT)/Resolucion-RE+(RE-RI)/2,
	       PuntoEnCurva(
				 Solucion3x3([
						   [1				    ,1		     ,1],
						   [Resolucion*Resolucion/4,Resolucion/2,1],
						   [Resolucion*Resolucion   ,Resolucion   ,1]
						  ],
						  [
						   [DT-(FT/Resolucion)*sin(ANV)],
						   [FDZ*(DT-GP/4*cos(ANV))],
						   [0]
						  ]),
				 __i)[0]
                 ])
 rotate([ANV+(90-ANV)*(__i/Resolucion),0,0])
 scale([PuntoEnCurva(
				    Solucion3x3([
						      [1				       ,1	        ,1],
						      [Resolucion*Resolucion   ,Resolucion   ,1],
						      [Resolucion*Resolucion/4,Resolucion/2,1]
						     ],
						    [
						    [1],
						     [2*RE/(DIM[TAM][1]+2*GP)],
						     [1+FRX*((2*RE/(DIM[TAM][1]+2*GP))-1)]
						   ]),
				    __i)[0]
	   ,PuntoEnCurva(
				    Solucion3x3([
						      [1				       ,1	        ,1],
						      [Resolucion*Resolucion   ,Resolucion   ,1],
						      [Resolucion*Resolucion/4,Resolucion/2,1]
						     ],
						    [
						    [1],
						     [(RE-RI)/(DIM[TAM][1]+2*GP)],
						     [1+FRY*(((RE-RI)/(DIM[TAM][1]+2*GP))-1)]
						   ]),
				    __i)[0]
	 ,1])
cylinder(h=0.0001,r=(DIM[TAM][1]+2*GP)/2,$fn=Resolucion);
 translate([0,
	       -((Resolucion-__i)*FT)/Resolucion-RE+(RE-RI)/2,
	       PuntoEnCurva(
				 Solucion3x3([
						   [1				    ,1		     ,1],
						   [Resolucion*Resolucion/4,Resolucion/2,1],
						   [Resolucion*Resolucion   ,Resolucion   ,1]
						  ],
						  [
						   [DT-(FT/Resolucion)*sin(ANV)],
						   [FDZ*(DT-GP/4*cos(ANV))],
						   [0]
						  ]),
				 __i)[0]
                 ])
 rotate([ANV+(90-ANV)*(__i/Resolucion),0,0])

hull()
   {
    translate([PuntoEnRecta(Resolucion,-RE+(RE-RI)/2,0,-(DIM[TAM][1]-(RE-RI))/2,__i),0,0])      cylinder(h=0.0001,r=(RE-RI)/2,$fn=Resolucion);
    translate([PuntoEnRecta(Resolucion, RE-(RE-RI)/2,0, (DIM[TAM][1]-(RE-RI))/2,__i),0,0])      cylinder(h=0.0001/2,r=(RE-RI)/2,$fn=Resolucion);
   } 
}
}

module SeccionToberaInterior(__i)
//Este módulo crea una porción de la tobera de grosor La longitud de la tobera/ Resolución
//Tiene la peculiaridad de ser parametizable y se genera con un radio de curvartura determinado 
{
 hull()
{
 translate([0,
	       -((Resolucion-__i)*FT)/Resolucion-RE+(RE-RI)/2,
	       PuntoEnCurva(
				 Solucion3x3([
						   [1				    ,1		     ,1],
						   [Resolucion*Resolucion/4,Resolucion/2,1],
						   [Resolucion*Resolucion   ,Resolucion   ,1]
						  ],
						  [
						   [DT-(FT/Resolucion)*sin(ANV)],
						   [FDZ*(DT-GP/4*cos(ANV))],
						   [0]
						  ]),
				 __i)[0]
                 ])
 rotate([ANV+(90-ANV)*(__i/Resolucion),0,0])
 scale([PuntoEnCurva(
				    Solucion3x3([
						      [1				       ,1	        ,1],
						      [Resolucion*Resolucion   ,Resolucion   ,1],
						      [Resolucion*Resolucion/4,Resolucion/2,1]
						     ],
						    [
						    [1],
						     [2*RE/(DIM[TAM][1]+2*GP)],
						     [1+FRX*((2*RE/(DIM[TAM][1]+2*GP))-1)]
						   ]),
				    __i)[0]-2*GP/(DIM[TAM][1]+2*GP)
	   ,PuntoEnCurva(
				    Solucion3x3([
						      [1				       ,1	        ,1],
						      [Resolucion*Resolucion   ,Resolucion   ,1],
						      [Resolucion*Resolucion/4,Resolucion/2,1]
						     ],
						    [
						    [1],
						     [(RE-RI)/(DIM[TAM][1]+2*GP)],
						     [1+FRY*(((RE-RI)/(DIM[TAM][1]+2*GP))-1)]
						   ]),
				    __i)[0]-2*GP/(DIM[TAM][1]+2*GP)
	 ,1])
 cylinder(h=0.0001,r=(DIM[TAM][1]+2*GP)/2,$fn=Resolucion);
 translate([0,
	       -((Resolucion-__i)*FT)/Resolucion-RE+(RE-RI)/2,
	       PuntoEnCurva(
				 Solucion3x3([
						   [1				    ,1		     ,1],
						   [Resolucion*Resolucion/4,Resolucion/2,1],
						   [Resolucion*Resolucion   ,Resolucion   ,1]
						  ],
						  [
						   [DT-(FT/Resolucion)*sin(ANV)],
						   [FDZ*(DT-GP/4*cos(ANV))],
						   [0]
						  ]),
				 __i)[0]
                 ])
 rotate([ANV+(90-ANV)*(__i/Resolucion),0,0])
  hull()
   {
    translate([PuntoEnRecta(Resolucion,-RE+(RE-RI)/2,0,-(DIM[TAM][1]-(RE-RI))/2,__i),0,0])      cylinder(h=0.0001,r=(RE-RI)/2-GPT,$fn=Resolucion);
    translate([PuntoEnRecta(Resolucion, RE-(RE-RI)/2,0, (DIM[TAM][1]-(RE-RI))/2,__i),0,0])      cylinder(h=0.0001/2,r=(RE-RI)/2-GPT,$fn=Resolucion);
   } 
}
}