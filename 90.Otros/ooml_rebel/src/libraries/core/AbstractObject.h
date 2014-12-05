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


#ifndef ABSTRACTOBJECT_H_INCLUDED
#define ABSTRACTOBJECT_H_INCLUDED

#include <iostream>
#include <string>
#include <sstream>

using namespace std;

class ContainerObject;

class AbstractObject
{
public:
    AbstractObject() : _dynamic(false), _copy_by_ref(false), _nrefs(0) {
        //setting the precision of the cout of double
        cout.setf(ios::fixed,ios::floatfield);   // floatfield set to fixed
        cout.precision(3);
    }
    virtual ~AbstractObject() {}
    virtual AbstractObject& translate(double tx, double ty, double tz);
    virtual AbstractObject& rotate(double ax, double ay, double az);
	 virtual AbstractObject& color(double r, double g, double b);
	 virtual AbstractObject& scale(double x, double y, double z);
	 virtual string gen_scad(int indent=0) const=0;
    virtual void print_ast(int indent) const=0;
    virtual AbstractObject& clone() const=0;

    virtual void add_to(ContainerObject& c);
    virtual void add_to(ContainerObject& c) const;

    void inc_refs() {++_nrefs;}
    void dec_refs();
    int get_refs() const {return _nrefs;}
    bool is_dynamic() const     {return _dynamic;}
    void set_copy_by_ref(bool ref) {_copy_by_ref=ref;}
    bool is_copy_by_ref() const {return _copy_by_ref;}

     //-- Function for accesing the private attributes
    void set_dynamic(bool flag) {_dynamic=flag;}

static void debug_mode() {debug_flag=true;}

protected:

    //-- Helper functions
	 static string spaces(int);

    //-- Print the private attributes
    void print_properties() const;

    void debug(string s) const { if (debug_flag) cout << "//--" << s << endl;}

private:
    bool _dynamic;       //-- Has been dinamically created?
    bool _copy_by_ref;   //-- Copying behaviour: The object is copied or referenced
    int _nrefs;          //-- How many pointer to this object there are?

    static bool debug_flag;
};


#endif // ABSTRACTOBJECT_H_INCLUDED
