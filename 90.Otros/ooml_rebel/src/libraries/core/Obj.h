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

#ifndef EXPR_H_INCLUDED
#define EXPR_H_INCLUDED

#include "AbstractObject.h"
#include "UniObject.h"

/***************************************************************************/
/* Obj class                                                              */
/*-------------------------------------------------------------------------*/
/* Objesions are UniObject that represent the operations with Objects     */
/* Objesion are the root node of the sintax abstract trees for performing */
/* the operations                                                          */
/*                                                                         */
/* This is the main class used by the user for constructing objects from   */
/*  primitive Objects by means of operations                               */
/***************************************************************************/

class Obj : public UniObject
{
public:

    //-- Default Constructor
    Obj() {}

    //-- General constructors
    Obj(AbstractObject& obj)
        {debug("Obj constructor AbstractObject"); add(obj);}

    Obj(const AbstractObject& obj)
        {debug("Obj constructor AbstractObject const"); add(obj);}

    //-- Optimizing constructors. An expresion that contains another
    //-- expresion is simplified so that there is only one Obj node
    //-- as the root
    Obj(Obj& e);
    Obj(const Obj& e);

    //-- Destructor!
    ~Obj();

    /** Particular translate operation only for Objesions for
     * optimization purposes. When an expresion is translated,
     * only the children are affected. The Obj node is removed, as it
     * should be only in the root
     */
    AbstractObject& translate(double tx, double ty, double tz);

    /** Particular rotate operation only for Objesions for
     * optimization purposes. When an expresion is rotated,
     * only the children are affected. The Obj node is removed, as it
     * should be only in the root
     */
    AbstractObject& rotate(double ax, double ay, double az);


    void add_to(ContainerObject& c);
    void add_to(ContainerObject& c) const;

    //-- Assigment operation. Two expresion can be assign
    Obj& operator=(const AbstractObject& obj);
    Obj& operator=(AbstractObject& obj);
    Obj& operator=(Obj& e);

    Obj& operator+=(const AbstractObject& obj);
    Obj& operator+=(Obj& e);

	 virtual string gen_scad(int indent=0) const;
    virtual void print_ast(int indent) const;

    Obj& clone() const;

};



#endif // EXPR_H_INCLUDED
