circle_outside_diameter=15;
nut_outside_diameter=10.3;
//nut_sides=6;
nut_z=11; //main z dimension
blade_length=36; //26 from virtual center
blade_angle=60;
blade_thickn=5;
rotorThickn=4;

$fn = 64;

difference(){
rotor();
fhex(nut_outside_diameter,nut_z); //drilled octagon (position for nut)
}    

module fhex(wid,height){
hull(){
cube([wid/1.7,wid,height],center = true);
rotate([0,0,120])cube([wid/1.7,wid,height],center = true);
rotate([0,0,240])cube([wid/1.7,wid,height],center = true);
}
}

module rotor(){
cylinder(h=nut_z,d=nut_outside_diameter+rotorThickn,center=true);
blades();
}

module blades(){
rotate([0,0,blade_angle]) translate([0,nut_outside_diameter/2-2,-nut_z/2]) cube([blade_thickn,blade_length,nut_z],center=false);
rotate([0,0,360/3]) rotate([0,0,blade_angle]) translate([0,nut_outside_diameter/2-2,-nut_z/2]) cube([blade_thickn,blade_length,nut_z],center=false);
rotate([0,0,2*360/3]) rotate([0,0,blade_angle]) translate([0,nut_outside_diameter/2-2,-nut_z/2]) cube([blade_thickn,blade_length,nut_z],center=false);

}