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


#ifndef ROTATION_H_INCLUDED
#define ROTATION_H_INCLUDED

#include <sstream>

#include "AbstractObject.h"
#include "UniObject.h"

using namespace std;

/*************************************************************************/
/* Rotation class                                                     */
/*-----------------------------------------------------------------------*/
/* These represent UniObjects that contain the object to be translated   */
/* It is an internal class and should NOT be used directly by the users  */
/*************************************************************************/


class Rotation : public UniObject
{
public:
    Rotation(double ax, double ay, double az): ax(ax), ay(ay), az(az)
    {   id=num; ++num;
        stringstream s;
        s << "Rotation CONSTRUCTOR! (" << id << ")";
        debug(s.str());
     }

    ~Rotation()
    {   stringstream s;
        s <<"//Rotation DESTRUCTOR! (" << id << ")";
        debug(s.str());}

	 string gen_scad(int indent) const;
    void print_ast(int indent) const;
    Rotation& clone() const;

    static int num;

/* A translation is defined by the translation vector, with three  */
/* components: translation along the x, y and z axes               */
private:
    double ax; //!< Rotation angle around x axis in grads
    double ay; //!< Rotation angle around y axis in grads
    double az; //!< Rotation angle around z axis in grads

    int id;
};


#endif // ROTATION_H_INCLUDED
