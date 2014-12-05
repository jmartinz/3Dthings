#include <Vector.h>

Vector::Vector()
{
set_value_pose(0,0,0);
set_value_normal(0,0,0);
}

Vector::Vector(float tx, float ty, float tz, float ax, float ay, float az)
{
set_value_pose(tx,ty,tz);
set_value_normal(ax,ay,az);
}


void Vector::set_pose(float a, float b, float c)
{
pose[0] =+ a;
pose[1] =+ b;
pose [2] =+ c;
}


void Vector::set_value_pose(float a, float b, float c)
{
pose[0] = a;
pose[1] = b;
pose [2] = c;
}


void Vector::set_normal(float a, float b, float c)
{
normal[0] =+ a;
normal[1] =+ b;
normal[2] =+ c;
}


void Vector::set_value_normal(float a, float b, float c)
{
normal[0] = a;
normal[1] = b;
normal[2] = c;
}


float Vector::get_normal(int pos)
{
    if(pos>2) pos=2;
    if(pos<0) pos=0;
    return normal[pos];
}

float Vector::get_pose(int pos)
{
    if(pos>2) pos=2;
    if(pos<0) pos=0;
    return pose[pos];
}
