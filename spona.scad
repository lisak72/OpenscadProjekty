
y_delka=78;

module prvni_kruh(){
difference(){   
   cylinder(h=1.4,r=7, $fn=100); 
translate([0,0,-0.1]) cylinder(h=1.6,r=2, $fn=100); //odectena
//vyrez
rotate(45) translate([0,0,-0.1]) cube([0.5,7,1.6]);
}
}

module spojka(){
hull(){
translate([-2.8,3,0]) cube([7,5,1.4]); //prvni kostka v prvnim kruhu
translate([-2,y_delka,0]) cube([4.5,5,1.4]); //druha v druhem kruhu
}
}

module druhy_kruh0(){
//translate([8.5,46,0]){
cylinder(h=1.4,r=7, $fn=100);
}

module odecet_druhy_kruh(){
translate([0,0,-0.1]) rotate(195){
    cylinder(h=1.6,r=2.5, $fn=100); 
    translate([-2.5,0,0]) cube([5,15,1.6]);
}}



module druhy_kruh(){
translate([4,y_delka+8,0])
difference() {
druhy_kruh0(); 
    odecet_druhy_kruh();
    }
}


prvni_kruh();
spojka();
druhy_kruh();
