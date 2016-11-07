#ifndef VECTOR_H
#define VECTOR_H


class Vector
{
    public:
        /** Default constructor */
        Vector();
	/** Constructor with parameters */
	Vector(float tx, float ty, float tz, float ax, float ay, float az);

	void set_pose(float a, float b, float c);	/** Set the parameters of pose depending on the previous pose */
	void set_normal(float a, float b, float c);	/** Set the parameters of normal depending on the previous normal */
	void set_value_pose(float a, float b, float c);		/** Set the parameters of pose with absolute values */
	void set_value_normal(float a, float b, float c);		/** Set the parameters of normal with absolute values */
	float get_pose(int pos);
	float get_normal(int pos);

    protected:
    private:
	float pose[3];		/** Position of the vector */
	float normal[3];	/** Orientation of the vector */
};

#endif // VECTOR_H
