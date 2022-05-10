 $fn=100;
 bottom_height=14;
 diameter_bottom=65;
 side_thickness=2;
 diameter_bottom_corr=diameter_bottom+side_thickness*2;
 bottom_side_thickness=side_thickness;
 deck_angle=45;
 upper_cylinder_h=13;
 hole_diameter=10;


module bottom_round(){
    rotate_extrude() 
    {#translate([diameter_bottom_corr/2,0,0]) rotate([0,0,90]) square([bottom_height,bottom_side_thickness]);}
}

module deck(){
    //ale deck udelat pres rotate extrusion triangle / hrany budou kolme
    rotate_extrude()
        {
           translate([diameter_bottom_corr/2,0,0]) rotate([0,0,180-deck_angle]) square([diameter_bottom_corr/2,bottom_side_thickness]);
        }
}

deck();
bottom_round();