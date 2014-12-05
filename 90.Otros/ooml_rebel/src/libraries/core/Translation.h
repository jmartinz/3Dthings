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


#ifndef TRANSLATION_H_INCLUDED
#define TRANSLATION_H_INCLUDED

#include <sstream>

#include "AbstractObject.h"
#include "UniObject.h"

using namespace std;

/*************************************************************************/
/* Translation class                                                     */
/*-----------------------------------------------------------------------*/
/* These represent UniObjects that contain the object to be translated   */
/* It is an internal class and should NOT be used directly by the users  */
/*************************************************************************/


class Translation : public UniObject
{
public:
    Translation(double tx, double ty, double tz): tx(tx), ty(ty), tz(tz)
    {   id=num; ++num;
        stringstream s;
        s << "Translation CONSTRUCTOR! (" << id << ")";
        debug(s.str());
     }

    ~Translation()
    {   stringstream s;
        s <<"//Translation DESTRUCTOR! (" << id << ")";
        debug(s.str());}

	 string gen_scad(int indent) const;
    void print_ast(int indent) const;
    Translation& clone() const;

    static int num;

/* A translation is defined by the translation vector, with three  */
/* components: translation along the x, y and z axes               */
private:
    double tx;
    double ty;
    double tz;

    int id;
};


#endif // TRANSLATION_H_INCLUDED
