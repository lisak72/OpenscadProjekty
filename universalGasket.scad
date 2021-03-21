//in milimeters
//material flex
//t 90/245
hole_diameter=34.5;
outer_diameter=44.5;
thickness=2;

translate([0,0,thickness/2]){
difference(){
//outer
cylinder(h=thickness,r=outer_diameter/2,center=true,$fn=100);
//hole
cylinder(h=thickness+2,r=hole_diameter/2,center=true,$fn=100);
}
}