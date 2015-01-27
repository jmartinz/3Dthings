/*****************************************************************************************************************/
/*	DESCRIPCION: 	Libreria con funciones matemáticas para cálcular los puntos en una	*/
/*				recta y una curva definida por otros puntos dados.			*/
/*				Módulos para elementos geométricos diversos.				*/
/*															*/
/*	AUTOR:		Dracnas										*/
/*	CONTACTO:		dracnas2014@gmail.com							*/
/*	FECHA:		01/09/2014										*/
/*	LICENCIA:		GNU GPL V3									*/
/*****************************************************************************************************************/

//Funcion que obtiene el valor Y=f(X) para una recta definida por 2 puntos (X0,Y0) e (X1,Y1)
function PuntoEnRecta(X0 , Y0 , X1 ,  Y1, X)=Y0+(X-X0)*((Y1-Y0)/(X1-X0));

//Funcion que obtiene el valor Y=f(X) para una curva definida por la ecuación y=ax^2+bx+c
function PuntoEnCurva(A,B,C,X)=A*X*X+B*X+C;

//Funcion que obtiene el valor Y=f(X) para una curva definida por la ecuación y=A[0]x^2+A[1]x+A[2]
function PuntoEnCurva(A,X)=A[0]*X*X+A[1]*X+A[2];

//Calcula el determinante de una matriz de 3x3
function determinante3x3(A)=A[0][0]*A[1][1]*A[2][2]+A[0][1]*A[1][2]*A[2][0]+A[1][0]*A[2][1]*A[0][2]-
				        A[2][0]*A[1][1]*A[0][2]- A[1][0]*A[0][1]*A[2][2]-A[0][0]*A[1][2]*A[2][1];

//Resuelve un sistema de 3 ecuaciones con 3 incognitas del tipo
//[A]*[X]=[B]
//[A00 A01 A02] [X]  [B0]		A00X+A01Y+A02Z=B0
//[A10 A11 A12]*[Y]=[B1] =>	A10X+A11Y+A12Z=B1
//[A20 A21 A22] [Z]  [B2]		A20X+A21Y+A22Z=B2
function Solucion3x3(A,B)=[	determinante3x3([	 [B[0],A[0][1],A[0][2]],
							    	 [B[1],A[1][1],A[1][2]],
							     	 [B[2],A[2][1],A[2][2]]
							  				 ])/determinante3x3(A),
					determinante3x3([ [A[0][0],B[0],A[0][2]],
								[A[1][0],B[1],A[1][2]],
								[A[2][0],B[2],A[2][2]]
											])/determinante3x3(A),
					determinante3x3([ [A[0][0],A[0][1],B[0]],
								[A[1][0],A[1][1],B[1]],
								[A[2][0],A[2][1],B[2]]
											])/determinante3x3(A)
							];

module toroide(RadioInterior,RadioExterior,Resolucion=50)
//Este módulo crea un toroide de Radios interior y exterior parametrizables
{
 rotate_extrude(convexity = 10,$fn = Resolucion)  translate([(RadioInterior+RadioExterior)/2, 0, 0])  circle(r = (RadioExterior-RadioInterior)/2,$fn = Resolucion); 
}

module Tuerca(Metrica)
//Este módulo crea una tuerca DIN 934 de métrica por parámetro (sin rosca interior) center=false
{
 //DIN934
 if(Metrica==2) 	cylinder(h=1.6,d=4.38,$fn=6,center=true);
 if(Metrica==3) 	cylinder(h=2.4,d=6.01,$fn=6,center=true);
 if(Metrica==4) 	cylinder(h=3.2,d=7.66,$fn=6,center=true);
 if(Metrica==5) 	cylinder(h=4,d=8.79,$fn=6,center=true);
 if(Metrica==6) 	cylinder(h=5,d=11,$fn=6,center=true);
 if(Metrica==8) 	cylinder(h=6.5,d=14.38,$fn=6,center=true);
 if(Metrica==10) 	cylinder(h=8,d=18.9,$fn=6,center=true);
}

module TuercaN(Metrica)
//Este módulo crea una tuerca DIN 934 de métrica por parámetro (sin rosca interior) center=true
{
 if(Metrica==2)	{translate([0,0,-0.8])	Tuerca(Metrica);}
 if(Metrica==3)	{translate([0,0,-1.2])	Tuerca(Metrica);}
 if(Metrica==4)	{translate([0,0,-1.6])	Tuerca(Metrica);}
 if(Metrica==5)	{translate([0,0,-2])		Tuerca(Metrica);}
 if(Metrica==6)	{translate([0,0,-2.5])	Tuerca(Metrica);}
 if(Metrica==8)	{translate([0,0,-3.25])	Tuerca(Metrica);}
 if(Metrica==10)	{translate([0,0,-4])		Tuerca(Metrica);}

}
module PortaTuerca(Metrica,Pared)
//Este módulo crea un soporte para una tuerca DIN 934 de métrica y grosor de pared por parámetro (center=false)
{
 if(Metrica==2)	{translate([0,0,-0.8])	PortaTuercaN(Metrica,Pared);}
 if(Metrica==3)	{translate([0,0,-1.2])	PortaTuercaN(Metrica,Pared);}
 if(Metrica==4)	{translate([0,0,-1.6])	PortaTuercaN(Metrica,Pared);}
 if(Metrica==5)	{translate([0,0,-2])		PortaTuercaN(Metrica,Pared);}
 if(Metrica==6)	{translate([0,0,-2.5])	PortaTuercaN(Metrica,Pared);}
 if(Metrica==8)	{translate([0,0,-3.25])	PortaTuercaN(Metrica,Pared);}
 if(Metrica==10)	{translate([0,0,-4])		PortaTuercaN(Metrica,Pared);}
}
module PortaTuercaN(Metrica,Pared)
//Este módulo crea un soporte para una tuerca DIN 934 de métrica y grosor de pared por parámetro centrada (center=true)
{
 difference()
 {
  if(Metrica==2) 	cylinder(h=1.6,d=4.38+2*Pared , $fn=20,center=true);
  if(Metrica==3) 	cylinder(h=2.4,d=6.01+2*Pared,  $fn=20,center=true);
  if(Metrica==4) 	cylinder(h=3.2,d=7.66+2*Pared,  $fn=20,center=true);
  if(Metrica==5) 	cylinder(h=4,   d=8.79+2*Pared,  $fn=20,center=true);
  if(Metrica==6) 	cylinder(h=5,   d=11+2*Pared,     $fn=20,center=true);
  if(Metrica==8) 	cylinder(h=6.5,d=14.38+2*Pared,$fn=20,center=true);
  if(Metrica==10) 	cylinder(h=8,   d=18.9+2*Pared,  $fn=20,center=true);
  scale([1,1,2])  Tuerca(Metrica);
 }
}
module cubosemiredondeado(a,b,c,r,fn=50)
//Este modulo crea un cubo redondeado en 4 de sus paredes
{
 hull()
 {
  translate([a/2-r,b/2-r,0])  	cylinder(r=r,h=c,$fn=fn,center=true);
  translate([-a/2+r,b/2-r,0])  	cylinder(r=r,h=c,$fn=fn,center=true);
  translate([-a/2+r,-b/2+r,0])	cylinder(r=r,h=c,$fn=fn,center=true);
  translate([a/2-r,-b/2+r,0])	cylinder(r=r,h=c,$fn=fn,center=true);
 }
}
