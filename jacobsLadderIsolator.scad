
cube_x=31;
cube_y=50;
cube_z=45;
border_thickness=3;
border_z=3;
drill_diameter=2;
drill_z=15;
$fn=50;

module mainCube(){
cube([cube_x+2*border_thickness,cube_y,cube_z]);
}

module rails(){
    difference(){
        translate ([0,0,-border_z]) cube([cube_x+2*border_thickness,cube_y,border_z]);
        translate ([+border_thickness,0,-border_z]) cube([cube_x,cube_y,border_z]);
    }
}

module mainCubeDrilled(){
difference(){
        mainCube();
      #  rotate([-2,0,0]) translate([(cube_x+2*border_thickness)/2,cube_y/2-5,cube_z-drill_z+1]) cylinder(d=drill_diameter,h=drill_z);
      #  rotate([2,0,0]) translate([0,20,0]) translate([(cube_x+2*border_thickness)/2,cube_y/2-5,cube_z-drill_z]) cylinder(d=drill_diameter,h=drill_z);
}
}

mainCubeDrilled();
rails();