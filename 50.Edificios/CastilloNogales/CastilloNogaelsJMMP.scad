radio = 4.2/2;
ancho=sqrt(2*radio*radio);
rTH=17; //sqrt(2*pow(2,12.3))/2;
ladoAlmTH = 12.3/15;
dCubo=3+radio*sin(45);//+radio;sqrt(2*3*3);

module torre_homenaje(){
//
	
	difference(){
		cube(size=[12.3,12.3,22.7]);
		translate([2/2,2/2,-1])agujeroTH();//cube(size=[12.3-3,12.3-3,22.7-2]);
	}
	translate([0,0,22.7])almenasTH();
}

module cubo(){
	difference(){
		cylinder(h = 8.30, r = radio, center = false, $fn=20);
		for ( i = [0 : 7] )
		{
			rotate([0,0,i*45])translate([0,0,7.8])cube(size=[.5,radio*6,1],center=true);
		}
		translate([0,0,7.3])cylinder(h = 8.30, r = radio/2, center = false, $fn=20);
	}
}

module muralla(){
	difference(){
		cube(size=[12.3+dCubo*2,12.3+dCubo*2,6]);
		translate([ancho/2,ancho/2,-50])cube(size=[12.3+dCubo*2-ancho,12.3+dCubo*2-ancho,100]);
		translate([ancho/2-0.75,ancho/2-0.75,4])cube(size=[12.3+dCubo*2-ancho+1.5,12.3+dCubo*2-ancho+1.5,100]);
		translate([12.3+dCubo*2-ancho-3,-ancho/2,2])
			union(){
				cube(size=[1.5,5,1.5]);
				translate([1.5/2,5,1.5])rotate([90,0,0])cylinder(h=5,r=1.5/2,$fn=20);
			}	

		agujerosMuralla();
	}
	translate([12.3+dCubo*2-ancho-3,-4.3,-0.2])rotate([25,0,0])cube(size=[1.5,4.8,0.2]);
}

module castillo(){
	torre_homenaje();
	translate([-dCubo,-dCubo,0]) cubo();
	translate([-dCubo,12.3 + dCubo,0]) cubo();
	translate([12.3 + dCubo,-dCubo,0]) cubo();
	translate([12.3 + dCubo,12.3 + dCubo,0]) cubo();
	translate([-dCubo,-dCubo,0])muralla();


}

module almenaTH(){
	cube(size=[ladoAlmTH,ladoAlmTH,1]);
	polyhedron(
  points=[ [0,0,1],[ladoAlmTH,0,1],[ladoAlmTH,ladoAlmTH,1],[0,ladoAlmTH,1], // the four points at base
           [ladoAlmTH/2,ladoAlmTH/2,1.7]  ],                                 // the apexont 
triangles=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],          // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base

 );

}

module almenasTH(){
		for ( i = [0 : 7] )
	{
    		translate([0, i*2*ladoAlmTH, 0])
    		almenaTH();
	}


		for ( i = [0 : 2] )
	{
    		translate([i*2*ladoAlmTH,0, 0])
    		almenaTH();
	}

		for ( i = [5 : 7] )
	{
    		translate([i*2*ladoAlmTH,0, 0])
    		almenaTH();
	}
		for ( i = [0 : 7] )
	{
    		translate([7*2*ladoAlmTH, i*2*ladoAlmTH, 0])
    		almenaTH();
	}
		for ( i = [0 : 7] )
	{
    		translate([i*2*ladoAlmTH,7*2*ladoAlmTH, 0])
    		almenaTH();
	}

}

module agujerosMuralla(){
		for ( i = [0 : 7] )
	{
    		translate([ 3*i,0, 5.4])
    		cube(size=[0.5,2,0.8]);
	}
		for ( i = [0 : 7] )
	{
    		translate([ 0,3*i, 5.4])
    		cube(size=[2,0.5,0.8]);
	}
		for ( i = [0 : 7] )
	{
    		translate([ 3*i,12.3+dCubo*2-2, 5.4])
    		cube(size=[0.5,2,0.8]);
	}
		for ( i = [0 : 7] )
	{
    		translate([ 12.3+dCubo*2-2,3*i, 5.4])
    		cube(size=[2,0.5,0.8]);
	}
}
module tierra(){
	difference(){
		translate([12.3,0,-1.5])rotate([0,0,-90])import("castilloNogales.stl");
	translate([70+15,0,0])cube(size=[140,140,140],center=true);
	translate([-70-15,0,0])cube(size=[140,140,140],center=true);
	translate([0,70+15,0])cube(size=[140,140,140],center=true);
	translate([0,-70-15,0])cube(size=[140,140,140],center=true);
	}
	
}

module agujeroTH(){
	radioSphera= (12.3-2)/2;
	intersection(){
		cube(size=[12.3-2,12.3-2,22.7-radioSphera]);
		translate([radioSphera-.1,radioSphera-.1,-radioSphera])cylinder(h = 22.7, r2 = (12.3-2)/2, r1 = 12.3-2, center = false, $fn=20);
	}
	translate([radioSphera-.1,radioSphera-.1,22.7-radioSphera])sphere(r = radioSphera);

}


module base(){
	anchoBase =30;
	desp = anchoBase/2 - 12.3/2;
	difference(){
		translate([-desp,-desp,-.5])cube(size=[anchoBase,anchoBase,.51]);
		translate([2/2,2/2,-5])cube(size=[12.3-3,12.3-3,22.7-2]);
	}
}

translate([-12.3/2,-12.3/2,0])castillo();
//base();
tierra();

//cubo();
//muralla();
//agujerosMuralla();






