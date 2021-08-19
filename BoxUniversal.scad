inside_x=76;
inside_y=88;
inside_z=22;
borders_z=5;
borders_width=2;
//deck
box_x=inside_x+borders_width*2;
box_y=inside_y+borders_width*2;
deck_z=2;
//only for box
hole_radius=3;
hole_z=22;
box_z=inside_z+borders_width+deck_z;
//displayhole
disp_x=30;
disp_y=20;
movedisp_x=1;
movedisp_y=25;

module deck1() {
difference(){
cube([box_x,box_y,deck_z]);
translate([movedisp_x,movedisp_y,0]) cube([disp_x,disp_y,deck_z]); //displayhole
}}


module squareBorders(x_length,y_length,z_length,width){
difference(){
    //outer
cube([x_length,y_length,z_length]);
    //inside cutter
translate([width,width,-1]) cube([x_length-2*width,y_length-2*width,z_length+3]);
}
}

//deck

deck1();
    
translate([borders_width,borders_width,0]) squareBorders(box_x-2*borders_width,box_y-2*borders_width,borders_z,borders_width);


//box


module box1() {
difference(){
cube([box_x,box_y,box_z]);
translate([borders_width,borders_width,borders_width]) cube([box_x-borders_width*2,box_y-borders_width*2,box_z+9]);}
}

module cylinderCut(){
rotate([90,0,0]) cylinder(h=5,r=hole_radius, $fn=100); //cylinder for cutting holes for wires
}

translate([box_x+5,0,0]){    
difference(){
box1();
//translate([18,3,hole_z]) cylinderCut();
//translate([28,3,hole_z]) cylinderCut();
translate([18,box_y+1,hole_z]) cylinderCut();
translate([28,box_y+1,hole_z]) cylinderCut();
}}


