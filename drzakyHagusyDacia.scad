//in milimeters
final_pos=[0,0,0];
final_pos_cyl=[20,18,67];
final_pos_base=[0,2,0];

translate([0,0,3]){ //cely objekt o 3 nahoru
translate(final_pos_base) cube([86,28,3]);//podlozka
difference(){
    translate(final_pos)cube([40,32,28]); //hlavni kostka
    translate(final_pos_cyl) rotate ([90,0,0]) cylinder (h = 40, r=45, center = true, $fn=100); //vyrezavaci cylinder
}
}

//hrany spodni
translate(final_pos){
difference() {cube([40,32,3]); 
translate([-0.5,2,-0.5]) cube([42,28,4]); //to je ta zmizela
} 
} //hrany spodni konec