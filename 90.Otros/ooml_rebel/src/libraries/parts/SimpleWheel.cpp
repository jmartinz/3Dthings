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


#include "SimpleWheel.h"

SimpleWheel::~SimpleWheel()
{
    //dtor
}

string SimpleWheel::gen_scad(int indent) const{
    Obj obj = gen_expression();
	 return obj.gen_scad(indent);
}

void SimpleWheel::print_ast(int indent) const{
    cout << "//- ";
    spaces(indent);

    //-- Print the cube's properties
    cout << "WHEEL("<< radius << "," << axe_radius << "," << width  << ")";

    //-- Print the object's properties
    print_properties();
}

SimpleWheel& SimpleWheel::clone() const{
    SimpleWheel* wheel = new SimpleWheel(radius, axe_radius, width);
    wheel->set_dynamic(true);
    return *wheel;
}

Obj SimpleWheel::gen_expression() const{
    Obj axe = Cylinder(axe_radius,width+1);
    Obj wheel = Cylinder(radius,width);
    wheel = wheel - axe;
    return wheel;
}
