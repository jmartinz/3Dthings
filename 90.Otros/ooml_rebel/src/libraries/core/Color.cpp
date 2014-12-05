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

#include "Color.h"

#include <iostream>
#include <sstream>


using namespace std;

int Color::num = 0;

string Color::gen_scad(int indent) const
{
	 stringstream out;

	 stringstream id;
	 id << "color([" << fixed << r << "," << g << "," << b << "]) {";

	 out << UniObject::gen_scad(id.str(),indent);

	 out << endl;
	 out << spaces(indent);
	 out << "} //end color" << endl;

	 return out.str();
}

void Color::print_ast(int indent) const
{
	 stringstream id;

	 id << "Color(" << fixed << r << "," << g << "," << b << ") ";
	 UniObject::print_ast(id.str(),indent);
}

Color& Color::clone() const
{
	 debug("Color: clone!");
	 Color* t = new Color(r,g,b);
	 UniObject::clone(t);

	 return *t;
}
