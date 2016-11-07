/**********************************************************************
 *
 * This code is part of the OOML project
 * Authors: Mario Almagro Cadiz, Juan Gonzalez-Gomez, Alberto Valero-Gomez
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

#ifndef BATTERYHOLDER_H
#define BATTERYHOLDER_H

#include "oom.h"
#include "PrimitivePart.h"

class BatteryHolder : public PrimitivePart
{
public:
	 BatteryHolder(int num_battery=4,int typ_battery=3, double thickness_wall=4){
			set_num_battery(num_battery);
			set_type_battery(typ_battery);
			set_thickness_wall(thickness_wall);
			fix_parameters();
	 }

	 /**
		* Generates the OpenSCAD code
		*/
	 virtual string gen_scad(int indent=0) const;
	 virtual void print_ast(int indent) const;

	 /**
		* Clones the Battery Holder
		*/
	 BatteryHolder& clone() const;

	 /**
		* Sets the number of batteries
		* @param n Number of batteries.
		*/
	 void set_num_battery(int n);
	 /**
		* Sets the type of batterie
		* @param t Type: 1: A, 2:AA, etc
		*/
	 void set_type_battery(int t);

	 /**
		* Sets the thickness of the battery holder walls
		*/
	 void set_thickness_wall(double);

	 /**
		* Gets the Total Width of the Battery Holder
		* @return total width in mm
		*/
	 double get_width();

	 /**
		* Gets the Total Length of the Battery Holder
		* @return total length in mm
		*/
	 double get_length();

	 /**
		* Gets the Total Height of the Battery Holder
		* @return total height in mm
		*/
	 double get_height();

protected:
	 int num_battery; //<! Number of batteries
	 int typ_battery; //<! Type of battery
	 double long_battery; //<! Length of battery
	 double d_battery; //<! diameter of the battery
	 double thickness_wall; //<! thickness of the battery walls

private:
	 /**
		* Genereates the Battery Holder Obj
		*/
	 virtual Obj gen_expression() const;

	 /**
		* Fix the battery dimensions according to the battery type
		*/
	 void fix_parameters();

};

#endif // BATTERYHOLDER_H
