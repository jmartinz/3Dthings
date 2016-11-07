
difference(){
cylinder(r=20, h=5);
translate([8.5,0,-2]) cylinder (r=5, h=16);
translate([-8.5,0,-2]) cylinder (r=5, h=16);
translate([0,8.5,-2]) cylinder (r=5, h=16);
translate([0,-8.5,-2]) cylinder (r=5, h=16);
}