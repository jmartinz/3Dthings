long = 100;
width = 100;
high = 100;

module caja(x,y,z){
    difference(){
        cube([x,y,z],center=true);
        translate([0,0,5])cube([x-5,y-5,z+5],center=true);
    }
}

module tapa(x,y,z){
    grosor = 5;
    font="Courier New:style=bold";
    difference(){
        union(){
                cube([x,y,grosor],center=true);
                translate([0,0,-grosor])cube([x-grosor/2-1,y-grosor/2-1,grosor],center=true);
        }
        union(){
            color("red")translate([-x/2+4,10,grosor-3.9])linear_extrude(height = 1.5) {text("Gonzalo", font = font, size = 16);}
            color("red")translate([-x/2+4,-20,grosor-3.9])linear_extrude(height = 1.5) {text("Piranha", font = font, size = 16);}
        }
    }
}


//caja(long,width,high);
//translate([0,0,high])
rotate([180,0,0])tapa(long,width,high);
