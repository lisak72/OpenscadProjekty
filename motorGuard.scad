diameter_inside=81;
thickness=2;
height=200;
bottomSide=2;
//support triangle
striangle_l=10;
striangle_w=10;
striangle_h=25;
screwl=10;
screww=2;


//translate([0,0,height/2]) hose();
support_triangle(striangle_l,striangle_w,striangle_h);



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
translate([-l/2,-w/2,0]){
    polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );} 
mirror([0,0,1]) difference() {cylinder(h=screwl,d=w); cylinder(h=screwl,d=screww);}
}
               }}}
