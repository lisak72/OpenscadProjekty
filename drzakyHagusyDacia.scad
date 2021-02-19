//in milimeters
translate([0,47,0]) cube([76,28,3]);//podlozka
difference(){
    translate([0,45,0])cube([40,32,26]); //hlavni kostka
    translate([20,60,72]) rotate ([90,0,0]) cylinder (h = 40, r=50, center = true, $fn=100); //vyrezavaci cylinder
}