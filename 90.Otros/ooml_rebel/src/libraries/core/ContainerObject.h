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



#ifndef CONTAINEROBJECT_H_INCLUDED
#define CONTAINEROBJECT_H_INCLUDED

#include <vector>
#include "AbstractObject.h"

using namespace std;

class Obj;
class Union;
class Difference;

class ContainerObject : public AbstractObject
{
public:
    ~ContainerObject();

    virtual void add(const AbstractObject& obj)=0;
    virtual void add(AbstractObject& obj)=0;

    //-- Object of type Obj are added in a different way,
    //-- for optimization purposes
    virtual void add(Obj& e)=0;
    virtual void add(Union& u)=0;
    //virtual void add(Difference& d)=0;

    //-- TODO: This atribute should be protected...
    //-- Objects in the container
    vector<AbstractObject*> obj;

protected:
    //-- Generic method for printing the ast of a ContainerObject
    void print_ast(string id, int indent) const;

    //-- Generic method for generating the openscad code of an UniObject
	 string gen_scad(string id, int indent) const;

};



#endif // CONTAINEROBJECT_H_INCLUDED
