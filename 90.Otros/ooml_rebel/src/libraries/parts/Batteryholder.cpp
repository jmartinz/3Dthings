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

#include "Batteryholder.h"


void BatteryHolder::set_num_battery(int n){
	 if(n<1)
		  num_battery=2;
	 else
                  num_battery=n;
}

void BatteryHolder::set_type_battery(int type){
	 if(typ_battery!=0 && typ_battery!=1 && typ_battery!=2 && typ_battery!=3 && typ_battery!=4 && typ_battery!=5)
		  typ_battery=3;
	 else
		  typ_battery=type;

         fix_parameters();
}

void BatteryHolder::set_thickness_wall(double w)
{
    if(w<3)
		  thickness_wall = 3;
    else
		  thickness_wall = w;
}

void BatteryHolder::print_ast(int indent) const{

}

Obj BatteryHolder::gen_expression() const
{
	 Obj part;

         double width_cube2 = num_battery*d_battery+(num_battery-1)*1.5;
	 Obj part2, cube2;
         Cube cube1(num_battery*d_battery+(num_battery-1)*1.5+2*thickness_wall,2*thickness_wall+long_battery,3+d_battery), cube2_aux(width_cube2,long_battery,d_battery);
	 Cylinder cylinder_aux(d_battery/2,long_battery);
	 Obj battery = cylinder_aux.rotate(90,0,0);


	 Cylinder cylinder(1.5,3*thickness_wall);
	 Cylinder cylinder2(2.5,4);
	 cylinder2.num_faces(6);
	 part2 = cylinder + cylinder2;

	 cube2 = cube1.translate(0,0,-1.5) - cube2_aux.translate(0,0,d_battery/2);
	 part = cube2;

	 for(int i=0; i<num_battery; i++)
	 {
                  part = part - battery.translate((width_cube2/2)-(d_battery/2)-i*(1.5+d_battery),0,0) - part2.rotate(-90,0,0).translate((width_cube2/2)-(d_battery/2)-i*(1.5+d_battery),(long_battery/2)+1,0) - part2.rotate(90,0,0).translate((width_cube2/2)-(d_battery/2)-i*(d_battery+1.5),-1-(long_battery/2),0);
	 }

	 part = part.translate(0,0,3+(d_battery/2));
	 return part;
}


string BatteryHolder::gen_scad(int indent) const
{
	 string output;
	 Obj part = gen_expression();
	 output = part.gen_scad(indent);
	 return output;
}


BatteryHolder& BatteryHolder::clone() const
{
	 BatteryHolder* battery_aux = new BatteryHolder(num_battery,typ_battery,thickness_wall);
	 battery_aux->set_dynamic(true);
	 return *battery_aux;
}



double BatteryHolder::get_width()
{
         return (num_battery*d_battery+(num_battery-1)*1.5+2*thickness_wall);
}

double BatteryHolder::get_length()
{
	 return (2*thickness_wall+long_battery);
}

double BatteryHolder::get_height()
{
    return (3+d_battery);
}


void BatteryHolder::fix_parameters()
{
    switch(typ_battery)
	 {
	 case 0: long_battery = 28.5; d_battery = 10.3; break;
	 case 1: long_battery = 42.5; d_battery = 8.3; break;
	 case 2: long_battery = 44.5; d_battery = 10.5; break;
	 case 3: long_battery = 51; d_battery = 14.5; break;
	 case 4: long_battery = 50; d_battery = 26.2; break;
	 case 5: long_battery = 61.5; d_battery = 34.2; break;
    }

    long_battery++;  // one millimeter of tolerance
}

