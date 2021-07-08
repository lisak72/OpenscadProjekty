diameterl=90.6; //inside diameter smaller
hl=20;
diameterh=110.6; //inside diameter bigger
hh=10;
thickn=2; //thickness
connAngle=35;
distance=(diameterh-diameterl)/2;
connl=(((distance)/sin(connAngle))+thickn/2); //length of connection (45deg side)
$fn=300;


module cyl1(){ //bigger
    rotate_extrude() translate([diameterh/2+thickn/2,0,0]) rotate([0,0,0]) square([thickn,hh], center=true);
}
module cyl2(){ //smaller
    rotate_extrude() translate([diameterl/2+thickn/2,0,0]) rotate([0,0,0]) square([thickn,hl], center=true);  
}
module connection(){
    rotate_extrude() translate([(diameterl+diameterh)/4+thickn,0,0]) rotate([0,0,connAngle]) square([thickn,connl], center=true);
}

translate([0,0,hh/2]) cyl1();
translate([0,0,hl/2+hh+cos(connAngle)*(distance)]) cyl2();
translate([0,0,((cos(connAngle)*distance)+hh)-(0.5*(cos(connAngle)*distance))]) connection();
