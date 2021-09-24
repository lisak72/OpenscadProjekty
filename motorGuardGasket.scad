diameter_inside=110;
diameter_inside_short=88;
thickness=5;
height=2;
bottomSide=0;
//support triangle
striangle_l=10;
striangle_w=10;
striangle_h=2;
screwl=1;
screww=2;
triangle_position_h=(height-(striangle_h+screwl)-height/2);
triangle_difference=-striangle_w/2;
triangle_position_l=diameter_inside/2+triangle_difference;
triangle_position_w=diameter_inside_short/2+triangle_difference;

//translate([0,0,height/2]) hose();
translate([triangle_position_l,triangle_position_w,triangle_position_h]) support_triangle(striangle_l,striangle_w,striangle_h);
translate([-triangle_position_l,triangle_position_w,triangle_position_h]) support_triangle(striangle_l,striangle_w,striangle_h);
translate([triangle_position_l,-triangle_position_w,triangle_position_h]) rotate([0,0,180]) support_triangle(striangle_l,striangle_w,striangle_h);
translate([-triangle_position_l,-triangle_position_w,triangle_position_h]) rotate([0,0,180]) support_triangle(striangle_l,striangle_w,striangle_h);

box();



module box() {
difference(){
//outside 
cube([diameter_inside+(thickness*2),diameter_inside_short+(thickness*2), height], center=true);
//vnitrni trubka odectena
translate([0,0,bottomSide]) cube([diameter_inside,diameter_inside_short, height], center=true);
}
}

module hose() {
difference(){
//outside cylinder
cylinder(h=height,r=(diameter_inside+thickness*2)/2,center=true,$fn=100);
//vnitrni trubka odectena
translate([0,0,bottomSide]) cylinder(h=height,r=diameter_inside/2,center=true,$fn=100);
}
}



module support_triangle(l,w,h){
translate([0,0,h]){
rotate([0,180,0]){
union(){
/*
translate([-l/2,-w/2,0]){
    polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );} 
               */
mirror([0,0,1]) difference() {cylinder(h=screwl,d=w+1); cylinder(h=screwl,d=screww);}
}
               }}}
