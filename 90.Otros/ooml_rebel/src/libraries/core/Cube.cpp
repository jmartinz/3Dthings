
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
#include <iostream>
#include "Cube.h"

using namespace std;

void Cube::size(double sx, double sy, double sz)
{
    this->sx=sx;
    this->sy=sy;
    this->sz=sz;
}

string Cube::gen_scad(int indent) const
{
	 stringstream out;
    spaces(indent);
	 out << "cube([" << sx << "," << sy << "," << sz <<"],center=true);" << endl;
	 return out.str();
}

void Cube::print_ast(int indent) const
{
    cout << "//- ";
    spaces(indent);

    //-- Print the cube's properties
    cout << "CUBE("<< sx << "," << sy << "," << sz << ")";

    //-- Print the object's properties
    print_properties();

}

Cube& Cube::clone() const
{
    Cube* cube = new Cube(this->sx,this->sy, this->sz);
    cube->set_dynamic(true);

    return *cube;
}
