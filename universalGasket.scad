//in milimeters
//material flex
//t 90/245
hole_diameter=33;
outer_diameter=85;
thickness=1;
$fn=400;

translate([0,0,thickness/2]){
difference(){
//outer
cylinder(h=thickness,r=outer_diameter/2,center=true);
//hole
cylinder(h=thickness+2,r=hole_diameter/2,center=true);
}
}