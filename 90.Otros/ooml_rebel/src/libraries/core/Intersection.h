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


#ifndef INTERSECTION_H_INCLUDED
#define INTERSECTION_H_INCLUDED

#include <sstream>

#include "AbstractObject.h"
#include "ContainerObject.h"
#include "MultiObject.h"
#include "Union.h"

using namespace std;


class Intersection : public MultiObject
{
public:
    Intersection()
      { id=num; ++num;
        stringstream s;
        s << "//Intersection: CONSTRUCTOR! (" << id << ")";
        debug(s.str()); }

    ~Intersection()
      {
          stringstream s;
          s << "Intersection: DESTRUCTOR! (" << id << ")";
          debug(s.str());}

    //** These add() methods invoke directly the MultiObject::add()
    void add(const AbstractObject& obj) {MultiObject::add(obj);}
    void add(AbstractObject& obj)       {MultiObject::add(obj);}
    void add(Obj& e)                   {MultiObject::add(e);}
    void add (Union& u)						 {MultiObject::add(u);}
    //** These is the exception: when adding Intersections to Intersection object
    //** only the children are added!
    void add(Intersection& d);

    void add_to(ContainerObject& c);

	 string gen_scad(int indent=0) const;
    void print_ast(int indent=0) const;
    Intersection& clone() const;

    static int num;

private:
    int id;
};

//** Operator +

//** General case
Intersection& operator*(AbstractObject& left, AbstractObject& right);
Intersection& operator*(const AbstractObject& left, const AbstractObject& right);
Intersection& operator*(AbstractObject& left, const AbstractObject& right);
Intersection& operator*(const AbstractObject& left, AbstractObject& right);


#endif // UNION_H_INCLUDED
