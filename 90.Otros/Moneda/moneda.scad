// Fusito v2.0
// http://clonewars.es
//
// based on William Adams' excellent ball-and-socket code
use <WriteSVG.scad>







difference(){
	cylinder(r=23.25/2, h=2.3, $fn=30);
    writecylinder("Clone Wars  GORT",[0,0,0],23/2,2.06,face="top" );
}

