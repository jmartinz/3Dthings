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

#ifndef OOM_CASTORWHEEL_H
#define OOM_CASTORWHEEL_H

#include "../core/oom.h"

class Support : public PrimitivePart{
public:
	 /**
		* Default Constructor
		*/
	 Support(){
                  length = 30; //<! Length in mm of the Castor Wheel Support (y axis)
		  opening_width= 8; //<! Width in mm of the Castor Wheel Support (x axis)
		  height = 25; //<! Height in mm of the Castor Wheel Support (z axis)
		  thickness=4; //<! Support Material Thickness in mm.
		  vertical_axis_radius = 3;
		  wheel_axis_radius = 3;

	 }

	 Support(double length, double opening_width, double height, double thickness, double vertical_axis_radius, double wheel_axis_radius):
				length(length),opening_width(opening_width),height(height),thickness(thickness),vertical_axis_radius(vertical_axis_radius), wheel_axis_radius(wheel_axis_radius)
	 {}

	 string gen_scad(int ident=0) const{
		  Obj obj = gen_expression();
		  return obj.gen_scad(ident);
	 }

	 void print_ast(int ident) const{
		  cout << "SUPPORT";
	 }

	 Support& clone() const{
		  Support* obj = new Support(length,opening_width,height,thickness,vertical_axis_radius,wheel_axis_radius);
		  obj->set_dynamic(true);
		  return *obj;
	 }


private:
	 /**
		* Generates the Expression of the Castro Wheel Support
		*/
	 virtual Obj gen_expression() const;

protected:

	 double length; //<! Length in mm of the Casto Wheel Support (y axis)
	 double opening_width; //<! Width in mm of the Castor Wheel Support (x axis)
	 double height; //<! Height in mm of the Castor Wheel Support (z axis)
	 double thickness; //<! Support Material Thickness in mm.
	 double vertical_axis_radius; //<! Radius (mm) of the axis of the Support (joint with the other objects)
	 double wheel_axis_radius; //<! Radius of the Castor Wheel Wheel.

public:

	 void wheel_axis_coords(double& x, double& y, double& z){

		  double vertical_width = 2*wheel_axis_radius + 2*thickness; //!Width in mm of the vertical support of the Castor Wheel Support (y axis)

		  x = 0;
		  y = length/2 - vertical_width/2;
		  z = -( height - (thickness + wheel_axis_radius) );

		  y += length/2 - thickness - vertical_axis_radius;
		  z += -thickness/2;
	 }

	 void inline set_length(double l){length=l;}
	 void inline set_opening_width(double w){opening_width=w;}
	 void inline set_height(double h){height=h;}
	 void inline set_thickness(double t){thickness=t;}
	 void inline set_vertical_axis_radius(double r){vertical_axis_radius=r;}
	 void inline set_wheel_axis_radius(double r){wheel_axis_radius=r;}

};

class CastorWheel : public Package {
public:
	 /**
		*Default Constructor
		*/
	 CastorWheel();
	 /**
		*Default Destructor
		*/
	 ~CastorWheel(){}

	 inline void set_wheel_radius(double r){
		  wheel_radius = r;
		  gen_package();
	 }

	 inline void set_wheel_thickness(double t){
		  wheel_thickness = t;
		  gen_package();
	 }

	 inline void set_axis_radius(double r){
		  axis_radius = r;
		  gen_package();
	 }

	 inline void set_vertical_radius(double r){
		  vertical_radius = r;
		  gen_package();
	 }

	 inline void set_support_thickness(double t){
		  support_thickness=t;
		  gen_package();
	 }



	 virtual void print_ast(int t=0) const{
	 }

protected:
	 /**
		* Generates the parts belonging to the scenario
		*/
	 virtual void gen_package();

	 virtual CastorWheel& clone() const;

private:
	 double wheel_radius; //!< The Castor Wheel radius.
	 double wheel_thickness; //!< The Castor Wheel Thickness.
	 double axis_radius; //!< The Castor Wheel axis radius
	 double vertical_radius; //!< The radius of the joint of the castor wheel
	 double support_thickness; //!< The thickness of the support material


};

#endif //OOM_CASTORWHEEL_H


