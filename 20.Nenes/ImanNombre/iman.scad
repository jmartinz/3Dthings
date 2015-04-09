//linear_extrude(height=5)
//text("Gonza", size =10,halign="center",font="Liberation Sans", $fn=20);



module iman(texto,fuente,tam){
    translate([0,0,3])
    linear_extrude(height=5)
    text(texto, size =tam,halign="center",font=fuente, $fn=20); 
    translate([0,-tam*0.15,0])
    hull(){
        linear_extrude(height=5)
        text(texto, size =tam*1.3,halign="center",font=fuente, $fn=20);
    }
    
}

iman("Claudia","Purisa",15);
translate([0,30,0])iman("Claudia","Liberation Sans",15);
translate([0,-30,0])iman("Claudia","Ubuntu",15);
translate([0,-60,0])iman("Claudia","Century Schoolbook L",15);
translate([0,60,0])iman("Claudia","Sawasdee",15);
translate([0,90,0])iman("Claudia","URW Chancery L",15);