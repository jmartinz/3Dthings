/**********************************************************************
 *
 * This code is part of the OOML project
 * Authors: Juan Gonzalez-Gomez, Alberto Valero-Gomez
 *
 * OOML is licenced under the Common Creative License,
 * Attribution-ShareAlike 3.0
 *
 * You are free:
 *   - to Share - to copy, distribute and transmit the work
 *   - to Remix - to adapt the work
 *
 * Under the following conditions:
 *   - Attribution. You must attribute the work in the manner specified
 *     by the author or licensor (but not in any way that suggests that
 *     they endorse you or your use of the work).
 *   - Share Alike. If you alter, transform, or build upon this work,
 *     you may distribute the resulting work only under the same or
 *     similar license to this one.
 *
 * Any of the above conditions can be waived if you get permission
 * from the copyright holder.  Nothing in this license impairs or
 * restricts the author's moral rights.
 *
 * It is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 * PURPOSE.
 **********************************************************************/

#include "CastorWheel.h"
#include "../libraries/parts/SimpleWheel.h"
#include "../libraries/core/Toroid.h"

Obj Support::gen_expression() const{

	 /** DEPENDANT VARIABLES*/
	 double vertical_width = 2*wheel_axis_radius + 2*thickness; //!Width in mm of the vertical support of the Castor Wheel Support (y axis)


	 //rounded horizontal surface
	 Obj hor =Cube(opening_width + 2*thickness, length , thickness);
	 Obj round = Cylinder((opening_width + 2*thickness)/2, thickness);
	 Obj _hor = Cube(opening_width + 2*thickness, (opening_width + 2*thickness)/2 , thickness);
	 round = round.translate(0 , - (length/2 - (opening_width + 2*thickness)/2 ) , 0);
	 _hor = _hor.translate(0 , - length/2 , 0);

	 hor = hor - _hor;
	 hor = hor + round;



	 Cube vertical(thickness,vertical_width, height);

	 //move alongside the y axis
	 Obj vertical_1 = vertical.translate(0,length/2-vertical_width/2,0);
	 //move alonside the z axis
	 vertical_1=vertical_1.translate(0,0,-height/2);
	 Obj vertical_2 = vertical_1.clone();

	 //move alongside the x axis
	 vertical_1 = vertical_1.translate( opening_width/2 + thickness/2 , 0 , 0 );
	 vertical_2 = vertical_2.translate(- (opening_width/2 + thickness/2) , 0 , 0 );

	 Obj support = hor + vertical_1 + vertical_2;


	 //make hole for wheel axis
	 Obj wheel_axis = Cylinder(wheel_axis_radius, opening_width + 2 * thickness + 2);
	 wheel_axis = wheel_axis.rotate(0,90,0);
	 //move it to the wheel position
	 wheel_axis=wheel_axis.translate( 0 , length/2 - vertical_width/2, - ( height - (thickness + wheel_axis_radius) ) );


	 support = support - wheel_axis.color(1,0,0);



	 //put the vertical axis on coords 0,0,0
	 support = support.translate(0 , length/2 - thickness - vertical_axis_radius  , 0);



	 //make hole for vertical axis
	 Obj vert_axis = Cylinder(vertical_axis_radius,thickness+1);
	 support = support - vert_axis.color(1,0,0);


	 //lay flat on xy plane
	 support = support.translate(0,0,-thickness/2);


	 return support;
}

CastorWheel::CastorWheel(){
	 wheel_radius = 10;
	 wheel_thickness = 5;
	 axis_radius = 1.5;
	 vertical_radius = 1.5;
	 support_thickness = 3;

	 gen_package();
}



CastorWheel& CastorWheel::clone() const{
	 CastorWheel* castor = new CastorWheel();
	 castor->set_dynamic(true);

	 return *castor;
}

void CastorWheel::gen_package(){

	 clear();

	 /** Support for the wheel**/
	 Support support;

	 support.set_height(2*wheel_radius);
	 support.set_length(2*wheel_radius);
	 support.set_opening_width(wheel_thickness+3);
	 support.set_thickness(support_thickness);
	 support.set_vertical_axis_radius(vertical_radius);
	 support.set_wheel_axis_radius(axis_radius);

	 (*this)["support"]=support;

	 /** The Wheel **/

	 SimpleWheel wheel(wheel_radius,axis_radius,wheel_thickness);
	 Toroid toro(wheel_radius,1.5,50);

	 Obj toro_wheel = wheel - toro;
	 toro_wheel = toro_wheel.rotate(0,90,0);

	 double x,y,z;

	 support.wheel_axis_coords(x,y,z);

	 //Move alongside y axis
	 toro_wheel = toro_wheel.translate(x , y , z );

	 (*this)["wheel"]=toro_wheel.color(1,0,0);
}


