//Porta pendrives param�trico

//Modulo para agujero. Las medidas de un conector USB son 11x4.7x13. Se hacen un poco m�s grande el agujero
module agujero(){

cube(size=[6,13,12]);
}

// Modulo para generar el porta Pendrives con el n� de agujeros como par�metro de entrada
module portaPD(nAg){
	// Se calcula la longitud del cuerpo principal
	// separacion del primer agujero + n�agujerosxancho agujeros+ n� agujeros menso uno por la separaci�n entre agujeros + separaci�n del �ltimo agujero
	longX = 5+6*nAg+10*(nAg-1)+5;
	difference(){
		// Cuerpo principal
		cube(size=[longX,23,12]); 

		//Agujeros	
		for ( i = [0:nAg-1 ] )
		{
			translate([5+i*15,5,1.5])agujero(); 
		}
	}
}

portaPD(3);