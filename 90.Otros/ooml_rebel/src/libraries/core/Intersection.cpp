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

#include <string>
#include <iostream>
#include "AbstractObject.h"
#include <typeinfo>
#include "Intersection.h"
#include "Obj.h"

int Intersection::num = 0;

void Intersection::add(Intersection& u)
{
    debug("Intersection::add ");

    for (unsigned int i=0; i<u.obj.size(); ++i) {
        add(*u.obj[i]);
    }

     //** Remove u if posible...
    if (u.is_dynamic() && u.get_refs()==0)
        delete &u;
}

void Intersection::add_to(ContainerObject& c)
{
    stringstream s;
    s << "Intersection::add_to() " << typeid(c).name();
    debug(s.str());

    c.add(*this);
}

string Intersection::gen_scad(int indent) const
{
	 stringstream out;
	 stringstream id;
	 id << "intersection() {";

	 out << MultiObject::gen_scad(id.str(),indent);
	 out << endl;
	 out << spaces(indent);
	 out<< "} //end intersencion" << endl;

	 return out.str();
}

void Intersection::print_ast(int indent) const
{
    string id = "INTERSECTION() ";
    MultiObject::print_ast(id,indent);
}

Intersection& Intersection::clone() const
{
    debug("Intersection: clone!");

    Intersection* u = new Intersection();
    MultiObject::clone(u);
    return *u;
}

Intersection& operator*(const AbstractObject& left, const AbstractObject& right)
{
    //cout << "OPERATOR + (const, const) " << endl;

    Intersection* u = new Intersection();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Intersection& operator*(AbstractObject& left, AbstractObject& right)
{
    //cout << "OPERATOR + (var, var) " << endl;

    Intersection* u = new Intersection();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Intersection& operator*(AbstractObject& left, const AbstractObject& right)
{
    //cout << "OPERATOR + (var, const) " << endl;

    Intersection* u = new Intersection();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Intersection& operator*(const AbstractObject& left, AbstractObject& right)
{
    //cout << "OPERATOR + (var, const) " << endl;

    Intersection* u = new Intersection();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

