
translate([-50,220,0])
scale([0.7,0.7,1])
union(){
    translate([0,0,5])scale([1,1,0.7])
    difference() {
        import("Electra_principal_fixed.stl", convexity=3);

        import("Electra_enchufe.stl", convexity=3);
        import("Electra_E.stl", convexity=3);
        import("Electra_e.stl", convexity=3);
        import("Electra_c.stl", convexity=3);
        import("Electra_a.stl", convexity=3);
        translate([159,-443,0])rotate(a=[0,0,300]) cube([2,8,50]);
         
    }

    translate([-15,85,0])scale([1.2,1.2,1])hull(){import("Electra_principal_fixed.stl", convexity=3);}
}
