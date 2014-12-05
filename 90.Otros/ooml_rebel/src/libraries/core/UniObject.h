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


#ifndef UNIOBJECT_H_INCLUDED
#define UNIOBJECT_H_INCLUDED

#include "ContainerObject.h"

class Obj;

/***********************************************************************/
/* UniObject Class                                                     */
/*---------------------------------------------------------------------*/
/* UniObjects are ContainerObjects that only contain one Object        */
/* They represent unary operations performed to the contained object,  */
/* such as translations, rotations, scaling, mirroring and so on       */
/***********************************************************************/

class UniObject: public ContainerObject
{
public:
    UniObject();
    ~UniObject();

    //-- Adding object to the container
    virtual void add(const AbstractObject& obj);
    virtual void add(AbstractObject& obj);

    //-- Object of type Obj are added in a different way,
    //-- for optimization purposes
    virtual void add(Obj& e);

    virtual void add(Union& c);

protected:

    //-- Generic method for cloning an UniObject
    void clone(UniObject* obj) const;

    //-- Remove the object from the container. The object
    //-- is removed is possible
    void unlink();

};

#endif // UNIOBJECT_H_INCLUDED
