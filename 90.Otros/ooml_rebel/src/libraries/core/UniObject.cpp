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
#include "UniObject.h"
#include "Obj.h"
#include "Union.h"
#include "PrimitiveObject.h"

using namespace std;

UniObject::UniObject()
{
    //-- Initialize the pointer to the object to NULL
    obj.push_back(0);
}

UniObject::~UniObject()
{
    debug("Uniobject: destructor");
}

void UniObject::add(Obj& e)
{
    debug("Obj::add!");

    if (e.obj[0]) {
      add(*e.obj[0]);
      if (e.is_dynamic() && e.get_refs()==0)
        delete &e;
    }
    else
        this->obj[0]=0;
}

void UniObject::add(Union& obj)
{
    //-- It is equal to the add(AbstractObject& obj)
    debug("//Uniobject ADD Union ");

    //-- remove the previous object, if any
    unlink();

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
    this->obj[0]=add_object;
}

void UniObject::add(AbstractObject& obj)
{
    debug("Uniobject ADD ");

    //-- remove the previous object, if any
    unlink();

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
    this->obj[0]=add_object;
}

void UniObject::add(const AbstractObject& obj)
{
    debug("Uniobject ADD const");

    //-- remove the previous object, if any
    unlink();

    //-- The object added only can be a copy
    AbstractObject* add_object = &obj.clone();

    //-- Only if it is dynamic, it can be cleant
    if (obj.is_dynamic() && obj.get_refs()==0)
        delete &obj;

    //-- Link the object
    add_object->inc_refs();
    this->obj[0]=add_object;

}

void UniObject::clone(UniObject* o) const
{
    o->set_dynamic(true);
    if (this->obj[0]) {
        o->obj[0] = &(this->obj[0]->clone());
        o->obj[0]->inc_refs();
    }
    else o->obj[0]=NULL;
}


//-- Unlink the object in the container
//-- The object is removed (if possible)
void UniObject::unlink()
{
    if (this->obj[0]) {
        debug("Unlinking...");
        this->obj[0]->dec_refs();
        delete this->obj[0];
        this->obj[0]=0;
    }
}



