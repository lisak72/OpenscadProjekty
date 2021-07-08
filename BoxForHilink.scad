inside_x=22;
inside_y=37;
inside_z=32;
borders_z=7;
borders_width=2;
//deck
box_x=inside_x+borders_width*2;
box_y=inside_y+borders_width*2;
deck_z=2;
//only for box
hole_radius=1.5;
hole_z=24;
box_z=inside_z+borders_width+deck_z;


module deck1() {

cube([box_x,box_y,deck_z]);

}


module squareBorders(x_length,y_length,z_length,width){
difference(){
    //outer
cube([x_length,y_length,z_length]);
    //inside cutter
translate([width,width,-1]) cube([x_length-2*width,y_length-2*width,z_length+3]);
}
}

deck1();
    
translate([borders_width,borders_width,0]) squareBorders(box_x-2*borders_width,box_y-2*borders_width,borders_z,borders_width);


//box


module box1() {
difference(){
cube([box_x,box_y,box_z]);
translate([2,2,+3]) cube([box_x-borders_width*2,box_y-borders_width*2,box_z+9]);}
}

module cylinderCut(){
rotate([90,0,0]) cylinder(h=5,r=hole_radius, $fn=100); //cylinder for cutting holes for wires
}

translate([box_x+5,0,0]){    
difference(){
box1();
translate([4,3,hole_z]) cylinderCut();
translate([22,3,hole_z]) cylinderCut();
translate([10,box_y+1,hole_z]) cylinderCut();
translate([16,box_y+1,hole_z]) cylinderCut();
}}


