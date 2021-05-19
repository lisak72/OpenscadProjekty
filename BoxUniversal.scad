//deck
box_x=32;
box_y=38;
deck_z=2;
borders_z=4;
borders_width=2;
//only for box
hole_radius=2.7;
hole_z=18;
box_z=22;


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
translate([5,3,hole_z]) cylinderCut();
translate([28,3,hole_z]) cylinderCut();
translate([22,box_y+1,hole_z]) cylinderCut();
}}


