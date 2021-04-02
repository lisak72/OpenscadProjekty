//in milimeters
//material 

hole_diameter=3;
outer_diameter=20;
thickness=100;


module lockcube(){
 translate([outer_diameter/2,0,thickness/2]) rotate([0,0,90]) cube([5,2,thickness], center=true);
}

module form(){
translate([0,0,thickness/2]){
difference(){
//outer
cylinder(h=thickness,r=outer_diameter/2,center=true,$fn=100);
//hole
cylinder(h=thickness+6,r=hole_diameter/2,$fn=100);
translate([outer_diameter/4,0,0]) cylinder(h=thickness+6,r=hole_diameter/2,$fn=100);
}
} 
}


union(){
form();
lockcube();
}