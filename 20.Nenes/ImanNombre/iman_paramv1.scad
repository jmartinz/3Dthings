
nombre="Claudia";

module iman(texto = nombre ,fuente = "Ubuntu",tam = 15){
    translate([0,0,3])
    linear_extrude(height=5)
    text(texto, size =tam,halign="center",font=fuente, $fn=20); 
    translate([0,-tam*0.15,0])
    hull(){
        linear_extrude(height=5)
        text(texto, size =tam*1.3,halign="center",font=fuente, $fn=20);
    }
    
}

iman();
