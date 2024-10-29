//hose cover / poklop na trubku

insideVert=107;
insideVertR=insideVert/2;
coverHoriz=140;
useMinkowski=0;

inside_z=25;
thick=6;
capThick=3;

//spacing middle
spacingPercents=25;
$fn=100;

module VerticalR(){
    difference(){
        cylinder(h = inside_z, r = insideVertR);
        cylinder(h = inside_z+1, r = insideVertR-thick/2);
    }
}

module HorizontalCover(){
    minkowski() {
        {
    rotate_extrude() {
        square(size=[coverHoriz/2,capThick]);
        }}
       if(useMinkowski) rotate([90,0,0]) cylinder(h = 1, r = 1);
    }
}


module Cross(){
    translate([-thick/2,-insideVertR,0]) cube([thick,insideVert,inside_z]);
    rotate([0,0,90]) translate([-thick/2,-insideVertR,0]) cube([thick,insideVert,inside_z]);
}

module SpacingMiddle(){
   # translate([0,0,capThick]) cylinder(h = inside_z, r1 = insideVertR*spacingPercents/100, r2=insideVertR);
}

module CoverHose(){
VerticalR();
HorizontalCover();
Cross();
}


difference() {
CoverHose();
SpacingMiddle(); 
}