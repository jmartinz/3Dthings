module caja () {

	difference () {
		union (){
			cube ([30,58,3]);
			translate ([0,0,44]) cube ([30,58,3]);
			cube ([30,3,45]);
			translate ([0,55,0]) cube ([30,3,45]);
		}
		translate ([-28.5,-0.5,0]) rotate ([0,30,0]) cube ([25,59,70]);

	}
	translate ([1.55,0,2]) rotate ([90,30,0])translate ([0,-1.2,0]) rotate ([0,90,0]) tapaCaja();
} // FIN MODULO CAJA

module tapaCaja(){
	difference () {
		cube ([23+26+9,27+(6.3+1.5)*2+8,2]); //53,50.6,2
		translate([24,13.80,-2])rotate([0,0,90])agujeroEnchufe();
		translate ([29.5,(50.6-27)/2+2,-2])agujeroBoton();

	}
}

module agujeroEnchufe(){
	cube([27,19.20,5]);

	translate ([-6.3,19.2/2,-2]) cylinder (r=1.5, h=10, $fn=15);
	translate ([27+6.3,19.2/2,-2]) cylinder (r=1.5, h=10, $fn=15);
}

module agujeroBoton(){
	cube([23,27,5]);	
}




module soporte(){
	difference (){
		cube ([15, 58, 47]);
		translate([-3,3,3])cube ([180, 52, 41]);
		translate ([13,-2,10]) rotate ([-90,0,0])  cylinder (r=4.1, h=157, $fn=60);
		translate ([13,-2,30]) rotate ([-90,0,0])  cylinder (r=4.1, h=157, $fn=60);
	}
}

module switchM(){
	union(){
		caja();
		translate([30,0,0])soporte();
	}
}

module boton(){
	difference (){
		cube([27,21.7,25.3]);
		translate([15.7,-0.50,0])cube([11.5,22.7,10.2]);
	}

}
module enchufe(){
	cube([30,19,26.5]);
}


rotate ([0,-120,0]) switchM();

