box_x=37;
box_y=54;
box_z=2;
borders_z=4;
borders_width=2;


module box1() {

cube([box_x,box_y,box_z]);

}


module squareBorders(x_length,y_length,z_length,width){
difference(){
    //outer
cube([x_length,y_length,z_length]);
    //inside cutter
translate([width,width,-1]) cube([x_length-2*width,y_length-2*width,z_length+3]);
}
}

box1();
    
translate([borders_width,borders_width,0]) squareBorders(box_x-2*borders_width,box_y-2*borders_width,borders_z,borders_width);