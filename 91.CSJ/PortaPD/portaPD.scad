//Porta pendrives paramétrico

//Modulo para agujero. Las medidas de un conector USB son 11x4.7x13. Se hacen un poco más grande el agujero
module agujero(){

cube(size=[5,12,12]);
}

// Modulo para generar el porta Pendrives con el nº de agujeros como parámetro de entrada
module portaPD(nAg){
	// Se calcula la longitud del cuerpo principal
	// separacion del primer agujero + nºagujerosxancho agujeros+ nº agujeros menso uno por la separación entre agujeros + separación del último agujero
	longX = 5+5*nAg+10*(nAg-1)+5;
	difference(){
		// Cuerpo principal
		cube(size=[longX,21,12]); 

		//Agujeros	
		for ( i = [0:nAg-1 ] )
		{
			translate([5+i*15,5,1.5])agujero(); 
		}
	}
}

portaPD(3);