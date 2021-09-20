circle_outside_diameter=15;
nut_outside_diameter=10.3;
//nut_sides=6;
nut_z=11; //main z dimension
blade_length_from_virtual_center=26;
blade_angle=60;

$fn = 64;


fhex(nut_outside_diameter,nut_z); //drilled octagon (position for nut)
    

module fhex(wid,height){
hull(){
cube([wid/1.7,wid,height],center = true);
rotate([0,0,120])cube([wid/1.7,wid,height],center = true);
rotate([0,0,240])cube([wid/1.7,wid,height],center = true);
}
}
