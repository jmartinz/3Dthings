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


#ifndef OOM_SCENARIO_H
#define OOM_SCENARIO_H

#include "Obj.h"
#include <map>
#include "string.h"

class Scenario : public map<string,Obj>
{
    public:
        /** Default constructor */
        Scenario();
        /** Default destructor */
        virtual ~Scenario();

        /**
         * Generates the OpenScad code of the created scenario
         */
		  virtual string gen_scad() const;


    protected:
    private:
			//map<string,Obj> scenario;
};

#endif // OOM_SCENARIO_H
