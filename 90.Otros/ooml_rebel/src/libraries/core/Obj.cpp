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

#include <iostream>
#include <typeinfo>
#include <sstream>
#include "AbstractObject.h"
#include "Obj.h"
#include "Translation.h"
#include "Rotation.h"
#include "Union.h"

using namespace std;

Obj::Obj(const Obj& e)
{
    debug("Obj constructor Obj const");
    this->add(e);
}

Obj::Obj(Obj& e)
{
    debug("Obj constructor Obj (E1)");
    this->add(e);
}

Obj::~Obj()
{
    debug("//Obj destructor");
}

void Obj::add_to(ContainerObject& c)
{
    stringstream s;
    s << "Obj::add_to " << typeid(c).name();
    debug(s.str());

    if (this->obj[0]) {
      //-- Add the expresion child to the container
      this->obj[0]->add_to(c);

      //-- Remove the expresion if posible!
      if (this->is_dynamic() && this->get_refs()==0)
          delete this;
    }

}

void Obj::add_to(ContainerObject& c) const
{
    stringstream s;
    s << "Obj::add_to (const) " << typeid(c).name();
    debug(s.str());

    if (this->obj[0]) {
        //-- Add the expresion child to the container
        this->obj[0]->add_to(c);

        //-- Remove the expresion if posible!
        if (this->is_dynamic() && this->get_refs()==0)
          delete this;
    }
}


Obj& Obj::operator=(const AbstractObject& obj)
{
    debug("Operator = const");
    obj.add_to(*this);
    return *this;
}

Obj& Obj::operator=(AbstractObject& obj)
{
    debug("Operator = ");
    this->add(obj);
    return *this;
}

Obj& Obj::operator=(Obj& e)
{
    debug("Operator = Obj");
    e.add_to(*this);
    return *this;
}

Obj& Obj::operator+=(Obj& e)
{
    debug("Opernator += Obj!");

    if (this->obj[0]) {
      Obj e2 = *(this->obj[0]) + e;
      this->add(e2);
    }
    else
      this->add(e);

    return *this;
}

Obj& Obj::operator+=(const AbstractObject& obj)
{
    debug("Opernator += AbstractObject const!");

    if (this->obj[0]) {
        Obj e = *(this->obj[0]) + obj;
        this->add(e);

        //-- Only if it is dynamic, it can be cleant
        if (obj.is_dynamic() && obj.get_refs()==0)
            delete &obj;
    }
    else {
      this->add(obj);
    }

    return *this;
}


void Obj::print_ast(int indent) const
{
    string id = "EXPR ";
    UniObject::print_ast(id,indent);
}

string Obj::gen_scad(int indent) const
{
	 stringstream out;

	 stringstream id;
	 id<< "Expression";
	 out << "//-";
	 out << ContainerObject::gen_scad(id.str(),indent);

	 return out.str();
}

Obj& Obj::clone() const
{
    debug("Obj: clone!");
    Obj* e = new Obj();
    UniObject::clone(e);

    return *e;
}


AbstractObject& Obj::translate(double tx, double ty, double tz)
{
    debug("EXPR TRANSLATE!!!");
    Translation* t = new Translation(tx,ty,tz);
    t->set_dynamic(true);
    t->add(*this);

    return *t;
}

AbstractObject& Obj::rotate(double ax, double ay, double az)
{
    debug("EXPR ROTATE!!!");
    Rotation* t = new Rotation(ax,ay,az);
    t->set_dynamic(true);
    t->add(*this);

    return *t;
}





