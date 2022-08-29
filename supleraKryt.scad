
cube1_x=17;
cube1_y=14;
cube1_z=0.5;
cube2_x=16;
cube2_y=cube1_y;
cube2_z=2;
border_thickness=3;
border_z=3;
drill_diameter=2;
drill_z=15;
$fn=50;

module bottomCube(){
cube([cube1_x,cube1_y,cube1_z],center=true);
}

module upperCube(){ //above bottom cube
translate([0,0,cube2_z/2]) cube([cube2_x,cube2_y,cube2_z],center=true);
}

bottomCube();
upperCube();