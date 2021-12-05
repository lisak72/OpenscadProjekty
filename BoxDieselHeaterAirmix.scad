inside_x=120;
inside_y=120;
inside_z=75;
borders_z=5;
borders_width=2;
//deck
box_x=inside_x+borders_width*2;
box_y=inside_y+borders_width*2;
deck_z=2;
//only for box
//hole1 outdoor air
hole1_radius=10.5;
hole_x=35;
hole_z=35;
//hole2 combustion sucction
hole2_radius=12;
hole2_x=35;
hole2_z=35;
//hole3 room air
hole3_radius=12;
hole3_x=35;
hole3_z=35;
//box
box_z=inside_z+borders_width+deck_z;
//displayhole
disp_x=93;
//disp_y=20;
movedisp_x=inside_x/2;
movedisp_y=inside_y/2;

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

module deck(){
deck1();    
translate([borders_width,borders_width,0]) squareBorders(box_x-2*borders_width,box_y-2*borders_width,borders_z,borders_width);
}

//box


module box1() {
difference(){
cube([box_x,box_y,box_z]);
translate([borders_width,borders_width,borders_width]) cube([box_x-borders_width*2,box_y-borders_width*2,box_z+9]);

            }
}

module cylinderCut(rott1,rott2=0,rott3=0,rad){
rotate([rott1,rott2,rott3]) cylinder(h=borders_width+8,r=rad, $fn=100); //cylinder for cutting holes for wires
}


module boxWithHoles(){    
//translate([box_x+5,0,0]){    
difference(){
box1();

#translate([hole_x,box_y+1,hole_z]) cylinderCut(90,0,0,hole1_radius); //hole1
#translate([hole2_x,2,hole2_z]) cylinderCut(90,0,0,hole2_radius); //hole2
#translate([0-1,hole3_x,hole3_z]) cylinderCut(0,90,0,hole3_radius); //hole2
#translate([movedisp_x,movedisp_y,-1]) cylinder(h=deck_z+5,d=disp_x, $fn=200); //displayhole

}}
//}

boxWithHoles();
//deck();

