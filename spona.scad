
s_delka=38;

module prvni_kruh(){
difference(){   
   cylinder(h=1.4,r=7, $fn=100); 
translate([0,0,-0.1]) cylinder(h=1.6,r=2, $fn=100); //odectena
//vyrez
rotate(45) translate([0,0,-0.1]) cube([0.3,7,1.6]);
}
}

module spojka(){
hull(){
translate([-2.8,3,0]) cube([7,5,1.4]);
translate([-2,s_delka,0]) cube([8,5,1.4]);
}
}

module druhy_kruh0(){
translate([8.5,46,0]){
cylinder(h=1.4,r=7, $fn=100);
}}

module odecet_druhy_kruh(){
translate([10,46,-0.1])
rotate(200){
    cylinder(h=1.6,r=2.5, $fn=100); 
    translate([-2.5,0,0]) cube([5,15,1.6]);
}}

module druha_cast(){
druhy_kruh0();
spojka();
}

module druhy_kruh(){
difference() {
druha_cast(); 
    odecet_druhy_kruh();
    }
}


prvni_kruh();
druhy_kruh();
