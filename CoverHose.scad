//hose cover / poklop na trubku

insideVert=107;
insideVertR=insideVert/2;
coverHoriz=140;

inside_z=25;
thick=3;
$fn=100;

module VerticalR(){
    difference(){
        cylinder(h = inside_z, r = insideVertR);
        cylinder(h = inside_z+1, r = insideVertR-thick/2);
    }
}

module HorizontalCover(){
    rotate_extrude() {
        square(size=[coverHoriz/2,thick]);
    }
}



VerticalR();
HorizontalCover();

