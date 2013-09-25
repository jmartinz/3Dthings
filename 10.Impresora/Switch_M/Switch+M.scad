module caja () {

difference () {
union (){
cube ([30,50,3]);
translate ([0,0,28]) cube ([30,50,3]);
cube ([25,3,28]);
translate ([0,47,0]) cube ([25,3,28]);
}
translate ([-25,-0.5,0]) rotate ([0,30,0]) cube ([22,51,70]);

}
translate ([1.55,0,2]) rotate ([0,30,0]) cube ([2,50,32]);

}


/*rotate ([0,-115,0]) difference () {
scale ([1,1,1.25]) caja () ;

translate ([0,20,18])  rotate ([0,30,0]) cube ([10,22,19]);
translate ([25,0,4.5]) cube ([5,50,29]);
translate ([8,10,25]) rotate ([0,115,0])  cylinder (r=1.7, h=10, $fn=60);
}*/



translate ([-30.2,25,19]) rotate ([-25,0,90]) difference (){
cube ([50, 38.8, 15], center=true);
cube ([50.5-8, 39.10-8, 16], center=true);

translate ([26,-11,5]) rotate ([0,-90,0])  cylinder (r=4.1, h=52, $fn=60);
translate ([26,9,5]) rotate ([0,-90,0])  cylinder (r=4.1, h=52, $fn=60);


}

caja();