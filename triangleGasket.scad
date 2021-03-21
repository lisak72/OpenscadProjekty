//in milimeters
//material flex
//t 90/245
hole_diameter=34.5;
outer_diameter=44.5;
thickness=8;

/*
translate([0,0,thickness/2]){
difference(){
//outer
cylinder(h=thickness,r=outer_diameter/2,center=true,$fn=100);
//hole
cylinder(h=thickness+2,r=hole_diameter/2,center=true,$fn=100);
}
}*/

triangle_points=[[0,0], [outer_diameter-hole_diameter,0],[0,thickness]];


module triang(){
translate([hole_diameter/2,0,0]) 
polygon(points=triangle_points);
}

//triang();

rotate_extrude($fn=200) triang();

