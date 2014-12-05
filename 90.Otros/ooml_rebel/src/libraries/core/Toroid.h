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


#ifndef TOROID_H_INCLUDED
#define TOROID_H_INCLUDED

#include <iostream>
#include "AbstractObject.h"
#include "PrimitiveObject.h"

using namespace std;

class Toroid : public PrimitiveObject
{
public:
    Toroid() : in_r(0), sec_r(0), quality(0) {}
    /**
     * Constructor
     * @param in_r The radius of the toroid.
     * @param sec_r The radius of the section of the toroid
     * @param quality The number of segments of the section.
     */
    Toroid(double in_r, double sec_r, double quality) : in_r(in_r), sec_r(sec_r), quality(quality)
      {debug("Toroid construct!");}

	/**
     * Sets the Params of the Toroid
     * @param in_r The radius of the toroid.
     * @param sec_r The radius of the section of the toroid
     * @param quality The number of segments of the section.
     */
    inline void params(double in_r, double sec_r, double quality){
		 this->in_r = in_r; this->sec_r=sec_r; this->quality=quality;
	 }
	 string gen_scad(int indent=0) const;
    void print_ast(int indent) const;
    Toroid& clone() const;

private:
    double in_r;
    double sec_r;
    double quality;
};


#endif // TOROID_H_INCLUDED
