#include "../libraries/core/oom.h"
#include "../libraries/packages/CastorWheel.h"
#include "../libraries/parts/SimpleWheel.h"
#include "../libraries/parts/ServoWheel.h"
#include "../libraries/parts/Batteryholder.h"

#include <iostream>
#include <fstream>

using namespace std;


int main(void){

	 ScadObject rebel;
	 rebel.import_from_file("REBEL_Anita.scad");
	 Cylinder cyl(55,20);

	 Obj obj = cyl - rebel.scale(1,1,2);

	 ofstream file;
	 file.open("rebel_cookie.scad");
	 file << obj.gen_scad();
	 file.close();

	 return 0;

}
