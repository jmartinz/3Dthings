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

#ifndef OOM_SIMPLEWHEEL_H
#define OOM_SIMPLEWHEEL_H

#include "oom.h"
#include "PrimitivePart.h"


class SimpleWheel : public PrimitivePart
{
    public:
        SimpleWheel(double radius, double axe_radius, double width):radius(radius),axe_radius(axe_radius),width(width){}
        virtual ~SimpleWheel();

		  virtual string gen_scad(int indent=0) const;
        virtual void print_ast(int indent) const;
        SimpleWheel& clone() const;
    protected:
        double axe_radius;
        double radius;
        double width;
    private:
        virtual Obj gen_expression() const;

};

#endif // OOM_SIMPLEWHEEL_H
