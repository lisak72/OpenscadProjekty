
hole_radius=1.7;
hole_z=9;
box_z=20;

module box1() {
difference(){
cube([37,54,box_z]);
translate([2,2,+3]) cube([33,50,box_z+9]);}
}

module cylinderCut(){
rotate([90,0,0]) cylinder(h=5,r=hole_radius, $fn=100); //cylinder for cutting holes for wires
}

difference(){
box1();
translate([10,3,hole_z]) cylinderCut();
translate([15,3,hole_z]) cylinderCut();
translate([22,55,hole_z]) cylinderCut();
}
