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

#ifndef OOM_PACKAGE_H
#define OOM_PACKAGE_H

#include "../core/oom.h"
#include <map>

class Package : public PrimitiveObject, public map<string,Obj> {
public:
	 /**
		*Default Constructor
		*/
	 Package();
	 /**
		*Default Destructor
		*/
	 ~Package(){}

	 virtual string gen_scad(int t=0) const {
		  stringstream out;
		  map<string,Obj>::const_iterator it;
		  for ( it=begin() ; it != end(); it++ ){
				out << "/** Begin " << (*it).first << "**/"<<endl;
				out << ((*it).second).gen_scad();
				out << "/** End " << (*it).first << "**/"<<endl;
		  }

		  return out.str();
	 }


protected:
	/**
	 * Function that generates the Package according to the used paramters
	 */
	 virtual void gen_package() = 0;

};

#endif //OOM_CASTORWHEEL_H
