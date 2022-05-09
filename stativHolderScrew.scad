hc=11;
$fn=100;
cylh=11;
holediam=5.05;

module base(){
    i=14;
    $fn=50;
    
    rc=2;
    hull(){
        translate([i,0,0])
        cylinder(h=hc,r=rc);
        translate([0,i,0])
        cylinder(h=hc,r=rc);
        translate([-i,0,0])
        cylinder(h=hc,r=rc);
        translate([0,-i,0])
        cylinder(h=hc,r=rc);
    
}}

module cylup(){
    diam=22;
translate([0,0,hc]) cylinder(d1=15,d2=13,h=cylh);
}

module hole1(){
    cylinder(d=holediam, h=hc+cylh);
}

difference(){
    union(){
        base();
        cylup();
    }
    translate([0,0,2]) hole1();
}
