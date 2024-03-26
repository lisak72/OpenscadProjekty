 //in milimeters
/*
translate([0,47,0]) cube([76,28,3]);//podlozka
difference(){
    translate([0,45,0])cube([40,32,26]); //hlavni kostka
    translate([20,60,72]) rotate ([90,0,0]) cylinder (h = 40, r=50, center = true, $fn=100); //vyrezavaci cylinder
}
*/
expansion=100; //percent
percentage=expansion/100;
height=2.5;
translate([0,0,0]){
difference(){
//vnejsi trubka
cylinder(h=height*percentage,r=(8.4/2)*percentage,center=true,$fn=100);
//vnitrni trubka odectena
cylinder(h=(height+3)*percentage,r=(5.3/2)*percentage,center=true,$fn=100);
}
}