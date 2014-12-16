//Porta pendrives paramétrico con textos
use <WriteSVG.scad>



//Modulo para agujero. Las medidas de un conector USB son 11x4.7x13. Se hacen un poco más grande el agujero
module agujero(){

cube(size=[5,12,12]);
}

// Modulo para generar el porta Pendrives con el nº de agujeros como parámetro de entrada
module portaPD(nAg,txtFront, textBack){
	// Se calcula la longitud del cuerpo principal
	// separacion del primer agujero + nºagujerosxancho agujeros+ nº agujeros menso uno por la separación entre agujeros + separación del último agujero
	longX = 5+5*nAg+10*(nAg-1)+5;

	union(){
		difference(){
			// Cuerpo principal
			cube(size=[longX,22,12]);
			
			//Agujeros	
			for ( i = [0:nAg-1 ] )
			{
				translate([5+i*15,5,1.5])agujero(); 
			}
			
			//Año 
			translate([1,21/2,10/2])rotate([0,0,-90])writecube("2014",[0,0,0],[0,0,0]);			
		}
		//Texto alante
		writecube(txtFront,[longX/2,0,12/2],[longX,0,10]);
		//Texto atrás
		translate([longX/2,22,12/2])rotate([0,0,180])writecube(textBack,[0,0,0],[0,0,0]);
		
	}
}


portaPD(5,"C. San Jose","Teresa");
