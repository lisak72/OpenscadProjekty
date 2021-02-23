
//in milimeters

final_pos=[0,0,0];
final_pos_cyl=[20,18,65];
final_pos_base=[0,2,0];

//hrany spodni
module hranySpodni(){
    translate(final_pos){
    difference() {cube([40,32,3]); 
    translate([-0.5,2,-0.5]) cube([42,28,4]); //to je ta zmizela
        } 
    } 
}

module hlavniObjekt(){
    translate([0,0,3]){ //cely objekt o 3 nahoru
        translate(final_pos_base) cube([86,28,3]);//podlozka
        difference(){
            translate(final_pos)cube([40,32,28]); //hlavni kostka
            translate(final_pos_cyl) rotate ([90,0,0]) cylinder (h = 40, r=42, center = true, $fn=100); //vyrezavaci cylinder
            }
    }
}

module dira(xd,yd,zd){
    translate([xd+1,yd,zd]){
    rotate([0,0,90]){
    translate([0.5,0,0]) cube([6,2,3.2]);
            translate([0.5,1,0]) cylinder(3.2,1,$fn=100);
   translate([6.5,1,0]) cylinder(3.2,1,$fn=100);
}}}

module dira90(xd,yd,zd){
translate([xd+1,yd,zd]){
rotate([0,0,0]){
translate([0.5,0,0]) cube([6,2,3.2]);
        translate([0.5,1,0]) cylinder(3.2,1,$fn=100);
translate([6.5,1,0]) cylinder(3.2,1,$fn=100);
}}}

module diry(){
    module serie_der(xsd){
    dira(50+xsd,5,2.9);
    dira(50+xsd,20,2.9);
    dira90(45+xsd,15,2.9);
}
    module zkoseni_hrany(xzk,yzk,lp){
translate([xzk,yzk]){
    rotate([0,0,(45*lp)]){ translate([0.5,0,2.9]) cube([20,6,3.6]);}}
}
        serie_der(0);
        serie_der(10);
        serie_der(20);
        serie_der(29);
        zkoseni_hrany(84,-3,1);
        zkoseni_hrany(94,25,3); //hrozny bastl toto

    }


module drzakHagusy(){
    hranySpodni();
difference() { hlavniObjekt();
                    diry();
}
}

drzakHagusy();
//dira(0,0,0);