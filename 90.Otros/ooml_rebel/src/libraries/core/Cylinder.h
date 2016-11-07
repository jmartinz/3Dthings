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


#ifndef CYLINDER_H_INCLUDED
#define CYLINDER_H_INCLUDED

#include <iostream>
#include "AbstractObject.h"
#include "PrimitiveObject.h"

using namespace std;

class Cylinder : public PrimitiveObject
{
public:
    Cylinder() : sr1(0), sr2(0), sh(0), faces(50) {}
    Cylinder(double sr1, double sr2, double sh) : sr1(sr1), sr2(sr2), sh(sh), faces(50)
		{debug("Cube construct!");}
    Cylinder(double sr1, double sh) : sr1(sr1), sr2(sr1), sh(sh), faces(50)
      {debug("Cube construct!");}

    void size(double sr1, double sr2, double sh);
    void num_faces(int faces){this->faces=faces;}
	 string gen_scad(int indent=0) const;
    void print_ast(int indent) const;
	 virtual Cylinder& clone() const;

private:
    double sr1;
    double sr2;
    double sh;
    int faces;
};


#endif // CUBE_H_INCLUDED
