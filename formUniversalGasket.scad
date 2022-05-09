//in milimeters
//material flex
//t 90/245
hole_diameter=2;
outer_diameter=16;
thickness=2;
innerh=2;
inner_diameter=11;

module gasketRing(){
translate([0,0,thickness/2+2]){
difference(){    
union(){
//outer
cylinder(h=thickness,r=outer_diameter/2,center=true,$fn=100);
//inner
 translate([0,0,innerh/2]) cylinder(h=thickness+innerh,r=inner_diameter/2,center=true,$fn=100); }   
//hole
cylinder(h=thickness+innerh+2,r=hole_diameter/2,center=true,$fn=100);
}
}}

module form(){
translate([0,0,thickness/2]){
difference(){
//outer
cylinder(h=thickness+3,r=outer_diameter/2+3,center=true,$fn=100);
//hole
cylinder(h=thickness+6,r=hole_diameter/2-3,center=true,$fn=100);
}
} 
}


difference(){
    //form();
gasketRing();
}