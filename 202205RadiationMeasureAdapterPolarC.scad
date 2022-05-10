 //cover for measuring fluorescence on soil surface
 //designing for Czech Polar Centre, CB
 //Jiri Liska, Trebon, 2022
 //print from black material, pctg or asa
 
 $fn=100;
 bottom_height=14;
 diameter_bottom=65;
 side_thickness=2;
 diameter_bottom_corr=diameter_bottom+side_thickness*2;
 bottom_side_thickness=side_thickness;
 deck_thickness=side_thickness;
 deck_angle=45;
 upper_cylinder_h=33;
 hole_diameter=10+0.2;
 upper_cylinder_precizing_z=0.5;
 p3y=tan(deck_angle)*(diameter_bottom/2); 
upper_cylinder_minus_value=tan(deck_angle)*((hole_diameter+deck_thickness)/2)+upper_cylinder_precizing_z;
 upper_cylinder_z_positioning=bottom_height+p3y-upper_cylinder_minus_value;  
 

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

module deck1(){
    
    point1=[diameter_bottom/2,0];
    point2=[diameter_bottom_corr/2,0];
    point3=[0,p3y];
    point4=[0,p3y-deck_thickness];
    rotate_extrude(){
        polygon([point1,point2,point3,point4]);
    }
}

module upper_tube(){
difference(){
cylinder(h=upper_cylinder_h,d=(hole_diameter+deck_thickness*2));

}
}

//execute
difference(){
    union(){
        bottom_round();
        translate([0,0,bottom_height]) deck1();
        translate([0,0,upper_cylinder_z_positioning]) upper_tube();
    } //union end
    translate([0,0,-0.5]) cylinder(h=bottom_height+p3y+upper_cylinder_h+1,d=hole_diameter);
}