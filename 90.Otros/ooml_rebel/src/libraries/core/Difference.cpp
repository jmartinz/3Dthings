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
#include "Difference.h"
#include "Obj.h"

int Difference::num = 0;

void Difference::add(Difference& u)
{
    debug("Difference::add ");

    for (unsigned int i=0; i<u.obj.size(); ++i) {
        add(*u.obj[i]);
    }

     //-- Remove u if posible...
    if (u.is_dynamic() && u.get_refs()==0)
        delete &u;
}

void Difference::add_to(ContainerObject& c)
{
    stringstream s;
    s << "Difference::add_to() " << typeid(c).name();
    debug(s.str());

    c.add(*this);
}

string Difference::gen_scad(int indent) const
{
	 stringstream out;
	 stringstream id;
	 id << "difference() {";

	 out << MultiObject::gen_scad(id.str(),indent);

	 out << endl;
	 out << spaces(indent);
	 out << "} //end difference" << endl;

	 return out.str();
}

void Difference::print_ast(int indent) const
{
    string id = "DIFFERENCE() ";
    MultiObject::print_ast(id,indent);
}

Difference& Difference::clone() const
{
    debug("Difference: clone!");

    Difference* u = new Difference();
    MultiObject::clone(u);
    return *u;
}

Difference& operator-(const AbstractObject& left, const AbstractObject& right)
{
    //cout << "OPERATOR + (const, const) " << endl;

    Difference* u = new Difference();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Difference& operator-(AbstractObject& left, AbstractObject& right)
{
    //cout << "OPERATOR + (var, var) " << endl;

    Difference* u = new Difference();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Difference& operator-(AbstractObject& left, const AbstractObject& right)
{
    //cout << "OPERATOR + (var, const) " << endl;

    Difference* u = new Difference();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Difference& operator-(const AbstractObject& left, AbstractObject& right)
{
    //cout << "OPERATOR + (var, const) " << endl;

    Difference* u = new Difference();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

