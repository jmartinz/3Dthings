//Porta pendrives param�trico con textos
use <WriteSVG.scad>



//Modulo para agujero. Las medidas de un conector USB son 11x4.7x13. Se hacen un poco m�s grande el agujero
module agujero(){

cube(size=[6,13,12]);
}

// Modulo para generar el porta Pendrives con el n� de agujeros como par�metro de entrada
module portaPD(nAg,txtFront, textBack){
	// Se calcula la longitud del cuerpo principal
	// separacion del primer agujero + n�agujerosxancho agujeros+ n� agujeros menso uno por la separaci�n entre agujeros + separaci�n del �ltimo agujero
	longX = 5+6*nAg+10*(nAg-1)+5;

	union(){
		difference(){
			// Cuerpo principal
			cube(size=[longX,23,12]);
			
			//Agujeros	
			for ( i = [0:nAg-1 ] )
			{
				translate([5+i*15,5,1.5])agujero(); 
			}
			
			//A�o 
			translate([1,21/2,10/2])rotate([0,0,-90])writecube("2014",[0,0,0],[0,0,0]);			
		}
		//Texto alante
		writecube(txtFront,[longX/2,0,12/2],[longX,0,10]);
		//Texto atr�s
		translate([longX/2,23,12/2])rotate([0,0,180])writecube(textBack,[0,0,0],[0,0,0]);
		
	}
}


portaPD(4,"C. San Jose","Mar");

translate([0, 40, 0])portaPD(4,"C. San Jose","Teresa");
