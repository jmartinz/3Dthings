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

#ifndef CUBE_H_INCLUDED
#define CUBE_H_INCLUDED

#include <iostream>
#include "AbstractObject.h"
#include "PrimitiveObject.h"

using namespace std;

class Cube : public PrimitiveObject
{
public:
    Cube() : sx(0), sy(0), sz(0) {}
    Cube(double sx, double sy, double sz) : sx(sx), sy(sy), sz(sz)
      {debug("Cube construct!");}

    void size(double sx, double sy, double sz);
	 string gen_scad(int indent=0) const;
    void print_ast(int indent) const;
    Cube& clone() const;

private:
    double sx;
    double sy;
    double sz;
};


#endif // CUBE_H_INCLUDED