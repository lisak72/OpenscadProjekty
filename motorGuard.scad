//in milimeters
/*
translate([0,47,0]) cube([76,28,3]);//podlozka
difference(){
    translate([0,45,0])cube([40,32,26]); //hlavni kostka
    translate([20,60,72]) rotate ([90,0,0]) cylinder (h = 40, r=50, center = true, $fn=100); //vyrezavaci cylinder
}
*/
diameter_inside=81;
thickness=2;
height=200;
bottomSide=2;


translate([0,0,height/2]) hose();




module hose() {
difference(){
//outside cylinder
cylinder(h=height,r=(diameter_inside+thickness*2)/2,center=true,$fn=100);
//vnitrni trubka odectena
translate([0,0,bottomSide]) cylinder(h=height,r=diameter_inside/2,center=true,$fn=100);
}
}