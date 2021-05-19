
module obj1() {
difference() {
cylinder(h=18,r=5.2/2+2, $fn=100,center=true );//vnejsi
cylinder(h=20,r=5.2/2, $fn=100,center=true); //vnitrni
}

translate([5.2/2,0,0]) cube([5.2-4.4,5.2,18],center=true);

translate([150/2+3,0,-13/2]) cube([150,5,5], center=true);
}

module obj2(){

difference(){
    cylinder(h=18,r=5/2+2, $fn=100,center=true );//vnejsi
    cylinder(h=20,r=5/2+0.01, $fn=100,center=true );//vnitrni
}
}
union(){
obj1();
translate([150+6,0,0]) obj2();
}