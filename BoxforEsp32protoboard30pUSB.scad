inside_x=30;
inside_y=55;
inside_z=20;
borders_z=6;
borders_width=2;
//deck
box_x=inside_x+borders_width*2;
box_y=inside_y+borders_width*2;
deck_z=2;
//only for box
hole_radius=1.5;
hole_z=16;
box_z=inside_z+borders_width+deck_z;
usb_cube_x=10;
usb_cube_z=7;


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

module cubeCut(){
rotate([90,0,0]) cube([usb_cube_x,borders_width*2,usb_cube_z], $fn=100); //cylinder for cutting holes for wires
    }

translate([box_x+5,0,0]){    
difference(){
box1();
translate([inside_x/2-3,3,borders_width*2]) cubeCut();
//translate([28,3,hole_z]) cylinderCut();
translate([22,box_y+1,hole_z]) cylinderCut();
translate([5,box_y+1,hole_z]) cylinderCut();
    translate([9,box_y+1,hole_z]) cylinderCut();
    translate([12,box_y+1,hole_z]) cylinderCut();
    translate([15,box_y+1,hole_z]) cylinderCut();
    translate([18,box_y+1,hole_z]) cylinderCut();
}}


