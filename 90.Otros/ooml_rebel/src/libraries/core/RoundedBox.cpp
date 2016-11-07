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

#include "RoundedBox.h"

int RoundedBox::num = 0;

RoundedBox::RoundedBox(double x, double y, double z, double r)
{
	 if (x<1) x_side=1;
	 else x_side = x;

	 if (y<1) y_side=1;
	 else y_side = y;

	 if (z<1) z_side=1;
	 else z_side = z;

	 r_round = r;
	 if (2*r_round > x) r_round = x/2;
	 if (2*r_round > y) r_round = y/2;
}

string RoundedBox::gen_scad(int indent) const
{
	 Cube flat(x_side-2*r_round , y_side-2*r_round , z_side);
	 Cylinder cyl (r_round,z_side);

	 Cube x_flat(x_side-2*r_round , r_round , z_side);
	 Cube y_flat(r_round , y_side - 2*r_round , z_side);

	 Obj round_box = flat + cyl.translate(x_side/2-r_round,y_side/2-r_round,0) + cyl.translate(-x_side/2+r_round,y_side/2-r_round,0) +
			  cyl.translate(-x_side/2+r_round,-y_side/2+r_round,0) + cyl.translate(x_side/2-r_round,-y_side/2+r_round,0) +
			  x_flat.translate(0,y_side/2 -r_round/2,0) + x_flat.translate(0,-y_side/2 +r_round/2,0) +
			  y_flat.translate(x_side/2-r_round/2,0,0) + y_flat.translate(-x_side/2+r_round/2,0,0);

	 return round_box.gen_scad();
}

void RoundedBox::print_ast(int indent) const
{
	 cout << "RoundedBox(" << fixed << x_side << "," << y_side << "," << z_side << "," <<r_round << ") ";

	 //-- Print the object's properties
	 print_properties();
}


RoundedBox& RoundedBox::clone() const
{
	 debug("RoundedBox: clone!");
	 RoundedBox* t = new RoundedBox(x_side,y_side,z_side,r_round);
	 t->set_dynamic(true);

	 return *t;
}



