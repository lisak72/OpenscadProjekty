    for(i=[-12:70])
    translate([i*1.9,0,0])
cylinder(r=1,h=sin(i*10)*50+53, $fn=100);
    module osa(){
    cylinder(r=0.5,h=155, center=true,$fn=100);}
        translate([50,0,52]) rotate([0,90,0]) osa();
    

