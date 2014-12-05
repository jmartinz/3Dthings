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
#include "Union.h"
#include "Obj.h"

int Union::num = 0;

void Union::add(Union& u)
{
    debug("Union::add ");

    for (unsigned int i=0; i<u.obj.size(); ++i) {
        add(*u.obj[i]);
    }

     //-- Remove u if posible...
    if (u.is_dynamic() && u.get_refs()==0)
        delete &u;
}

void Union::add_to(ContainerObject& c)
{
    stringstream s;
    s << "Union::add_to() " << typeid(c).name();
    debug(s.str());

    c.add(*this);
}

string Union::gen_scad(int indent) const
{
	 stringstream out;

	 stringstream id;
	 id << "union() {";

	 out << MultiObject::gen_scad(id.str(),indent);

	 out << endl;
	 out << spaces(indent);
	 out << "} //end union" << endl;

	 return out.str();
}

void Union::print_ast(int indent) const
{
    string id = "UNION() ";
    MultiObject::print_ast(id,indent);
}

Union& Union::clone() const
{
    debug("Union: clone!");

    Union* u = new Union();
    MultiObject::clone(u);
    return *u;
}

Union& operator+(const AbstractObject& left, const AbstractObject& right)
{
    //cout << "OPERATOR + (const, const) " << endl;

    Union* u = new Union();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Union& operator+(AbstractObject& left, AbstractObject& right)
{
    //cout << "OPERATOR + (var, var) " << endl;

    Union* u = new Union();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Union& operator+(AbstractObject& left, const AbstractObject& right)
{
    //cout << "OPERATOR + (var, const) " << endl;

    Union* u = new Union();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

Union& operator+(const AbstractObject& left, AbstractObject& right)
{
    //cout << "OPERATOR + (var, const) " << endl;

    Union* u = new Union();
    u->set_dynamic(true);

    left.add_to(*u);
    right.add_to(*u);

    return *u;
}

