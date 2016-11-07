
#ifndef OOM_COLOR_H
#define OOM_COLOR_H

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

#include <sstream>

#include "AbstractObject.h"
#include "UniObject.h"

using namespace std;

/*************************************************************************/
/* Color class                                                     */
/*-----------------------------------------------------------------------*/
/*************************************************************************/


class Color : public UniObject
{
public:
	 Color(double r, double g, double b): r(r), g(g), b(b)
	 {   id=num; ++num;
		  stringstream s;
		  s << "Color CONSTRUCTOR! (" << id << ")";
		  debug(s.str());
	  }

	 ~Color()
	 {   stringstream s;
		  s <<"//Color DESTRUCTOR! (" << id << ")";
		  debug(s.str());}

	 string gen_scad(int indent) const;
	 void print_ast(int indent) const;
	 Color& clone() const;

	 static int num;

/* A color is defined by the rgb code between 0.0 and 1.0  */
private:
	 double r,g,b; //!< rgb components (between 0. and 1.

	 int id;
};


#endif // OOM_COLOR_H_INCLUDED
