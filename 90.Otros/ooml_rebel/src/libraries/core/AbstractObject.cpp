
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
#include "ContainerObject.h"
#include "Translation.h"
#include "Rotation.h"
#include "Color.h"
#include "Scale.h"
#include "Cube.h"
#include "Obj.h"

using namespace std;

bool AbstractObject::debug_flag=false;

AbstractObject& AbstractObject::translate(double tx, double ty, double tz)
{
    stringstream s;
    s << "AbstractObject::Translate! " << typeid(*this).name();
    debug(s.str());

    Translation* t = new Translation(tx,ty,tz);
    t->set_dynamic(true);
    t->add(*this);

    return *t;
}

AbstractObject& AbstractObject::rotate(double ax, double ay, double az)
{
    /*for(int i=0; i<joints.size(); i++)
    {
	joints[i].set_normal(ax,ay,az);
    }*/

    stringstream s;
    s << "AbstractObject::Rotate! " << typeid(*this).name();
    debug(s.str());

    Rotation* t = new Rotation(ax,ay,az);
    t->set_dynamic(true);
    t->add(*this);

    return *t;
}

AbstractObject& AbstractObject::color(double r, double g, double b)
{
	 stringstream s;
	 s << "AbstractObject::Color! " << typeid(*this).name();
	 debug(s.str());

	 Color* t = new Color(r,g,b);
	 t->set_dynamic(true);
	 t->add(*this);

	 return *t;
}

AbstractObject& AbstractObject::scale(double x, double y, double z)
{
	 stringstream s;
	 s << "AbstractObject::Scale! " << typeid(*this).name();
	 debug(s.str());

	 Scale* t = new Scale(x,y,z);
	 t->set_dynamic(true);
	 t->add(*this);

	 return *t;
}



void AbstractObject::add_to(ContainerObject& c)
{
    stringstream s;
    s << "AbstractObject::add_to " << typeid(c).name();
    debug(s.str());

    c.add(*this);
}

void AbstractObject::add_to(ContainerObject& c) const
{
    stringstream s;
    s << "AbstractObject::add_to (const)" << typeid(c).name() << endl;
    debug(s.str());

    c.add(*this);
}

void AbstractObject::dec_refs()
{
    if (_nrefs<=0) {
        cout << "//AbstractObject: ERROR! refs counter: " << _nrefs << endl;
        return;
    }

    _nrefs -= 1;
}

string AbstractObject::spaces(int indent)
{
	 stringstream out;
    for (int i=0; i<indent; ++i)
		  out<< " ";

	 return out.str();
}

void AbstractObject::print_properties() const
{
    cout << " --- [Refs:" << _nrefs << ", ";
    cout << (_dynamic ? "Dynamic" : "Static") << ", ";
    cout << (_copy_by_ref ? "Ref" : "Copy") << "]" << endl;
}

