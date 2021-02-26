
module hlavni_objekt(){
cylinder(h=8,r=3.45,center=true,$fn=100);
translate([0,0,8]){
cylinder(h=8,r=2.5,center=true,$fn=100);
}}

hlavni_objekt();