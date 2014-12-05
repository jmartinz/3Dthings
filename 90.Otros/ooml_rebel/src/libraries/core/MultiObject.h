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

#ifndef MULTIOBJECT_H_INCLUDED
#define MULTIOBJECT_H_INCLUDED

#include "ContainerObject.h"

class Obj;

class MultiObject : public ContainerObject
{
public:
    MultiObject() {}
    ~MultiObject();

    virtual void add(const AbstractObject& obj);
    virtual void add(AbstractObject& obj);
    virtual void add(Obj& e);

protected:
    void clone(MultiObject* obj) const;

};


#endif // MULTIOBJECT_H_INCLUDED
