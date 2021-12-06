hole_diameter=22.0;
//outer_diameter=35.0;
outer_diameter=33;
down_outer_diameter=35.0;
down_outer_h=1.5;
thickness=3.0;
$fn=400;
inner_round_in=20.0;
inner_round_thickness=2.0;
inner_round_h=5.0;

module base_gasket(){
//translate([0,0,thickness/2]){
difference(){
//outer
cylinder(h=thickness,r=outer_diameter/2,center=true);
//hole
cylinder(h=thickness+2,r=hole_diameter/2,center=true);
}
}

module inner_gasket(){
difference(){
 cylinder(h=inner_round_h,d=inner_round_in+inner_round_thickness,center=true);
cylinder(h=inner_round_h,d=inner_round_in,center=true);   
}
}

module outer_gasket(){
difference(){
cylinder(h=down_outer_h+thickness,d=down_outer_diameter,center=true);
cylinder(h=down_outer_h+thickness,d=outer_diameter,center=true);
}}

    translate([0,0,thickness/2]) base_gasket();
    translate([0,0,inner_round_h/2]) inner_gasket();
    translate([0,0,(thickness-down_outer_h)/2]) outer_gasket();