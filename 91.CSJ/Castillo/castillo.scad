// torre con alto y ancho
module torre(alto,diametro){
	cylinder(h = alto, r=diametro/2);
	translate([0,0,alto])cylinder(h = alto/3, r1 = diametro/2, r2 = 0, center = false);
}

for ( i = [0 : 1] )
{
	for (j= [0:1])
	{
		translate([i*100,j*100,0])torre(100,40);
	}
}

cube(size=[100,100,80]);
translate([50,50,80])sphere(r=50);