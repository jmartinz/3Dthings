/*****************************************************************************************************************/
/*	DESCRIPTION:	Layer fan duct									*/
/*	DESCRIPCION: 	Tobera del ventilador de capa							*/
/*															*/
/*	AUTOR:		Dracnas										*/
/*	CONTACTO:		dracnas2014@gmail.com							*/
/*	FECHA:		01/09/2014										*/
/*	LICENCIA:		GNU GPL V3									*/
/*****************************************************************************************************************/

include <Configuracionprusai3jhead.scad>	//Configuration - Configuracion
use <libreria.scad>
use <ConoTobera.scad>
use <TerminalTobera.scad>
use <Soportes.scad>


//CODIGO
translate([0,0,FT+RE])		//Coment this line for real view, uncoment for print
rotate([180-ANV,0,0])		//Coment this line for real view, uncoment for print
difference()
{
 union()
 {
   SoportePpal();
   SoporteVentilador();
	difference()
	{
   	 ConoTobera();
	 RecorteVentilador();
	}
   TerminalTobera();
 } 
 union()
 {
  InteriorConoTobera();
  InteriorTerminalTobera();
  EspacioTuercas();
  TipoTobera();
 }
}
