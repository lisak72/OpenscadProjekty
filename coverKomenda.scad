diameter=36.5;
z_dim=9.0;
angle=5;
thickness=1;
$fn=100;

module maincylinder(){
cylinder(h=thickness,d=diameter,center=false, $fn=100);
}

module borders(){
rotate_extrude(){
    translate([diameter/2,0,0]) rotate([0,0,angle]) square([thickness,z_dim]);
} }

maincylinder();
borders();