#ifndef OOM_SCALE_H
#define OOM_SCALE_H


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
/* Scale class                                                     */
/*-----------------------------------------------------------------------*/
/*************************************************************************/


class Scale : public UniObject
{
public:
	 Scale(double x, double y, double z): x(x), y(y), z(z)
	 {   id=num; ++num;
		  stringstream s;
		  s << "Scale CONSTRUCTOR! (" << id << ")";
		  debug(s.str());
	  }

	 ~Scale()
	 {   stringstream s;
		  s <<"//Scale DESTRUCTOR! (" << id << ")";
		  debug(s.str());}

	 string gen_scad(int indent) const;
	 void print_ast(int indent) const;
	 Scale& clone() const;

	 static int num;

	 //-- Operator +


/* A Scale is defined by the xyz scaling  */
private:
	 double x,y,z; //!< scaling proportions

	 int id;
};


#endif // OOM_SCALE_H
