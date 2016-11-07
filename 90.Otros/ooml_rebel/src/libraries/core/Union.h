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


#ifndef UNION_H_INCLUDED
#define UNION_H_INCLUDED

#include <sstream>

#include "AbstractObject.h"
#include "ContainerObject.h"
#include "MultiObject.h"

using namespace std;


class Union : public MultiObject
{
public:
    Union()
      { id=num; ++num;
        stringstream s;
        s << "//Union: CONSTRUCTOR! (" << id << ")";
        debug(s.str()); }

    ~Union()
      {
          stringstream s;
          s << "Union: DESTRUCTOR! (" << id << ")";
          debug(s.str());}

    //-- These add() methods invoke directly the MultiObject::add()
    void add(const AbstractObject& obj) {MultiObject::add(obj);}
    void add(AbstractObject& obj)       {MultiObject::add(obj);}
    void add(Obj& e)                   {MultiObject::add(e);}
    //void add(Difference& e)             {MultiObject::add(e);}

    //-- These is the exception: when adding Unions to Union object
    //-- only the children are added!
    void add(Union& u);

    void add_to(ContainerObject& c);

	 string gen_scad(int indent=0) const;
    void print_ast(int indent=0) const;
    Union& clone() const;

    static int num;

private:
    int id;
};

//-- Operator +

//-- General case
Union& operator+(AbstractObject& left, AbstractObject& right);
Union& operator+(const AbstractObject& left, const AbstractObject& right);
Union& operator+(AbstractObject& left, const AbstractObject& right);
Union& operator+(const AbstractObject& left, AbstractObject& right);


#endif // UNION_H_INCLUDED
