/*****************************************************************************************************************/
/*	DESCRIPCION: 	Parametros de configuracion de la tobera del ventilador de capa	*/
/*	DESCRIPTION:	Configuraion parameters for layer fan duct					*/
/*															*/
/*	AUTOR:		Dracnas										*/
/*	CONTACTO:		dracnas2014@gmail.com							*/
/*	FECHA:		01/09/2014										*/
/*	LICENCIA:		GNU GPL V3									*/
/*****************************************************************************************************************/

/*EN: CONFIGURATION PARAMETERS FOR LAYER FAN DUCT (see help in images)*/
/*SP: PARAMETROS DE CONFIGURACIÓN DE LA TOBERA DEL VENTILADOR DE CAPA (ver ayuda en imagenes)*/
//----------------------------------------------------------------------------------------------------------//
//EN: 1.- GENERAL PARAMETERS 
//SP: 1.- PARAMETROS GENERALES
	GP=3;			//EN: wall thickness in mm
				//SP: Grosor de todas las paredes en mm
//----------------------------------------------------------------------------------------------------------//
//EN: 2.- PARAMETERS ABOUT FAN DUCT END
//SP: 2.- PARAMETROS RELACCIONADOS CON LA BOQUILLA CONECTADA AL FINAL DE LA TOBERA
	RI=10;		//EN:	Donut´s inner radius 
				//	The inner radius must to be enoght big to constains the hotend
				//SP:	Radio interior del donut (medio donut) que forma el terminal de la boquilla
				//	El radio interior debe ser suficientemente grande para alojar la boquilla del extrusor
				
	RE=17;		//EN: 	Donut´s outer radius
				//	The outer radius must bigger than the inner radius + two times the wall thickness.
				//	The space where air flows=RE-RI-2*GP
				//SP:	Radio exterior del donut (medio donut) que forma el terminal de la boquilla
				//	El radio exterior debe ser mayor que el radio interior + 2 veces el grosor de la pared, siendo el espacio
				//	por donde circula el aire=RE-RI-2*GPT

	GPT=2;		//EN: Fan duct end wall thickness.
				//SP: Grosor de la pared de la boquilla de la tobera
//----------------------------------------------------------------------------------------------------------//
//EN: 3.- FAN PARAMETERS
//SP: 3.- PARAMETROS RELACCIONADOS CON EL VENTILADOR
	TAM=1;		//EN: Fan dimensions (standar measurments), the standar dimensions can be edited in 7.-ADVANCED
				//	0: 30mm fan
				//	1: 40mm fan
				//	2: 50mm fan
				//	3: 60mm fan

				//SP: Dimensiones del ventilador (se suponen medidas estandar), las dimensiones se 
				//	pueden modificar en el apartado 7.-AVANZADAS
				//	0: Ventilador de 30mm
				//	1: Ventilador de 40mm
				//	2: Ventilador de 50mm
				//	3: Ventilador de 60mm

	ANV=45;		//EN:	Angle between fan and horizontal.
				//SP:	Angulo del ventilador con la horizontal
//----------------------------------------------------------------------------------------------------------//
//EN: 4.- DUCT CONE (the cone is located between the fan duct end and the fan)
//ES: 4.- CONO TOBERA (es el cono que va desde el ventilador hasta la boquilla)
	FT=30;		//EN:	Deph fan duct (X axis), distance between the fan duct end and the fan.
				//SP:	Fondo Tobera (eje X), es la distancia que va desde el terminal de salida hasta el ventilador.
	DT=20;		//EN	Distance from the fan duct to the XY plane.
				//SP:	Distancia de la tobera al plano XY

				//EN:	FRX,FRY & FRZ determine the shape of the duct cone, this allows to control the width (in the x(FRX) and
				//	y(FRY) axis) and the curve shape of the duct(FDZ).
				//SP:	FRX,FRY y FRZ determinan la forma del cono de la tobera, pudiendo controlar asi el ancho de la 
				//	misma en los ejes X(FRX) e Y(FRY) asi como la forma de la curva que hace la tobera (FDZ)
	FDZ=0.45;		//EN:	Curve displacement factor in the fan duct. Between 0.01 (low) and 0.99 (hight) [default=0.45]
				//SP:	Factor de la curva de desplazamiento de la tobera. Entre 0.01 (baja) y 0.99 (alta)[por defecto=0.45]
	FRY=0.5;		//EN:	Height factor in the fan duct. Between 0.01(width) and 0.99 (narrow)[default=0.5].
				//SP:	Factor de alto de la tobera. Entre 0.01(ancho) y 0.99(estrecho)[por defecto=0.5]
	FRX=0.6;		//EN:	Width factor in the fan duct. Between 0.01(width) and 0.99 (narrow)[default=0.6].
				//SP:	Factor de ancho de la tobera. Entre 0.01(estrecho) y 0.99(ancho)[por defecto=0.6]

//EN: 5.- SUPPORT				
//SP: 5.- SOPORTE
	DSX1=25;
	DSY1=0;
	DSZ1=53;		//EN:	(DSX1,DSY1,DSZ1) distance from the center of the "half-donut" to the first hole of the support
				//SP:	(DSX1,DSY1,DSZ1) distancia desde el centro del "semi-donut" al primer taladro del soporte

	DSX2=-25;
	DSY2=0;
	DSZ2=53;		//EN:	(DSX2,DSY2,DSZ2) distance from the center of the "half-donut" to the second hole of the support
				//SP:	(DSX2,DSY2,DSZ2) distancia desde el centro del "semi-donut" al segundo taladro del soporte
	
	GPS=3;		//EN: Wall thickness support
				//SP: Grosor de la pared del soporte

	SAM=5;		//EN:	Diameter of support holes
				//SP:	Diametro de los agujeros del taladro del soporte

//EN:	6.-OUTPUT TYPE FOR DUCT
//SP:	6.-TIPO DE SALIDA DE LA TOBERA
	TIPOSALIDA=1;	//EN:	0: No bottom output
				//SP:	0: Sin salida inferior
				//EN:	1: Bottom output full open
				//SP:	1: Salida inferior completamente abierta
				//EN:	2: Bottom output width holes
				//SP:	2: Salida inferior con taladros
//EN:	7.-ADVANCED
//SP:	7.-AVANZADOS
	Resolucion=50;	//EN: 	Resolution 10: debug 50: real
				//SP: 	Resolucion 10: baja 50 real
				//EN:	DIM is a matrix with the standar dimensions of fans 30-60mm
				//SP:	DIM es una matriz con las medidas estandar de los ventiladores de 30 a 60 mm
	DIM=[			
		 [32,27,24,3,1],	//30mm fan / Ventilador de 30mm
		 [42,37,32,3,2],	//40mm fan / Ventilador de 40mm
		 [52,47,40,4,2],	//50mm fan / Ventilador de 50mm
		 [62,57,50,4,2]	//60mm fan / Ventilador de 60mm
		];
				//EN:	Meaning of Matrix columns values
					//0: fan diameter
					//1: fan hole diameter where air flows.
					//2: distance between holes
					//3: Default metric screw that support the fan
					//4: wall thickness for the nut
				//SP:	Significado de las columnas de la matriz DIM
					//0: Diametro del ventilador
					//1: Diametro hueco interior del ventilador por donde fluye el aire
					//2: Distancia entre agujeros
					//3: Métrica del tornillo predeterminado que soporta el ventilador
					//4: Grosor de la pared donde va fijada la tuerca
		