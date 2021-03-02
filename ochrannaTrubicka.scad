//in milimeters
/*
translate([0,47,0]) cube([76,28,3]);//podlozka
difference(){
    translate([0,45,0])cube([40,32,26]); //hlavni kostka
    translate([20,60,72]) rotate ([90,0,0]) cylinder (h = 40, r=50, center = true, $fn=100); //vyrezavaci cylinder
}
*/
translate([0,0,20]){
difference(){
//vnejsi trubka
cylinder(h=40,r=5.2,center=true,$fn=100);
//vnitrni trubka odectena
cylinder(h=41,r=4.8,center=true,$fn=100);
}
}