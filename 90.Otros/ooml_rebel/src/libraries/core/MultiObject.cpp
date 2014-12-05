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
#include "MultiObject.h"
#include "Obj.h"

using namespace std;

MultiObject::~MultiObject()
{
    debug("MultiObject destructor!");
}

void MultiObject::add(Obj& e)
{
    debug("MultiObject::add (EXPR)!");

    if (e.obj[0]) {
      add(*e.obj[0]);
      if (e.is_dynamic() && e.get_refs()==0)
        delete &e;
    }
}

void MultiObject::add(const AbstractObject& obj)
{
    debug("MultiObject::add const! ");

    //-- The object added only can be a copy
    AbstractObject* add_object = &obj.clone();

    //-- Link the object
    add_object->inc_refs();
    this->obj.push_back(add_object);
}

void MultiObject::add(AbstractObject& obj)
{
    debug("MultiObject::add! ");

     //-- Get the object to be added: A copy or a direct link
    AbstractObject* add_object;
    if (obj.is_copy_by_ref())
        add_object = &obj;
    else {
        add_object = &(obj.clone());

        //-- Only if it is dynamic, it can be cleant
        if (obj.is_dynamic() && obj.get_refs()==0)
            delete &obj;
    }

    //-- Link the object
    add_object->inc_refs();
    this->obj.push_back(add_object);
}


void MultiObject::clone(MultiObject* m) const
{
    m->set_dynamic(true);
    for (unsigned int i=0; i<this->obj.size(); ++i) {
        if (this->obj[i]) {
            m->obj.push_back(&(this->obj[i]->clone()));
            m->obj[i]->inc_refs();
        }
        else m->obj[i]=NULL;
    }
}

