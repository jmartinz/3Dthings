// torre con alto y ancho
module torre(alto,diametro){
	cylinder(h = alto, r=diametro/2);
	translate([0,0,alto])cylinder(h = alto/3, r1 = diametro/2, r2 = 0, center = false);
}



module castillo(alto,diametro)
{
	//cuerpo principal
	cube(size=[alto,alto,alto*0.8]);
	
	//Cupula
	translate([alto/2,alto/2,alto*0.8])sphere(r=alto/2);

	//4 torres
	for ( i = [0 : 1] )
	{
		for (j= [0:1])
		{
			translate([i*alto,j*alto,0])torre(alto,diametro);
		}
	}
}

castillo(100,40);