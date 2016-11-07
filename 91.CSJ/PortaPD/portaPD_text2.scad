use <MCAD/fonts.scad>

module agujero(){

cube(size=[4.7,11,10]);
}


module portaPD(nAg){
	longX = 5*2+(4.7+10)*(nAg-1)+4.7;
	difference(){
		cube(size=[longX,21,10]);

		for ( i = [0:nAg-1 ] )
		{
			translate([5+i*14.7,5,1.5])agujero(); 
		}
	}
}



module portaPDtxt(word, font_scale, font_spacing, nAg )
{
longX = 5*2+(4.7+10)*(nAg-1)+4.7;
thisFont=8bit_polyfont();
x_shift=thisFont[0][0] * font_spacing;
y_shift=thisFont[0][1];

	theseIndicies=search(word,thisFont[2],1,1);
	wordlength = (len(theseIndicies))* x_shift;
	


	union() {

// Create the Text //
		translate([0,-y_shift/3,5])
		rotate(a=[90,0,0]) 
		scale([font_scale,font_scale,1]){
			for( j=[0:(len(theseIndicies)-1)] ) 
				translate([ j*x_shift + 1, -y_shift/2 ,-10/2]) 
				{
					linear_extrude(height=10/2) polygon(points=thisFont[2][theseIndicies[j]][6][0],paths=thisFont[2][theseIndicies[j]][6][1]);
				}
		}
			
// Main body
			portaPD(nAg);
	}


}
portaPDtxt("C. San Jose" , 1, 0.81, 5 );