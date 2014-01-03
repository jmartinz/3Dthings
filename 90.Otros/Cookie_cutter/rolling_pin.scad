// Rolling Pin Spacers
// all measurements are in mm

// Diameter of rolling pin in mm (best if slightly smaller than actual)
pin = 43/2;

// How thick you want the dough to be in mm
Dough = 5;

difference () {
   cylinder (h=7,r=pin+Dough, $fn = 200);
   translate ([0,0,-2]) cylinder (h=14,r=pin, $fn = 200);
   translate ([0,0,-2]) cube([pin+Dough+2,2,14]);
}
