//hose cover / poklop na trubku

insideVert=107;
coverHoriz=140;

inside_z=75;
thick=2;
$fn=100;

module VerticalR(){
    difference(){
        cylinder(h = inside_z, r = insideVert);
        cylinder(h = inside_z+1, r = insideVert-thick);
    }
}

module HorizontalCover(){
    rotate_extrude() {
        square(size=[coverHoriz,thick]);
    }
}



VerticalR();
HorizontalCover();

