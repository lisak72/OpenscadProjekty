
x_length=95;
y_length=80;
z_length=12;
rot=7; //angle of cuted segment
num=7; //number of cuted segment
perc=55;  //percent of cutted surface
shift=1.5; //shift of cuted segments to left
far_border_length=0.1; //far border length multiplier (0.1 is 10 percent)
oneCellXlength=x_length/num; //is computed


module cutfn(xl,yl,zl,rot){ //module cutter
perc=(10/perc);
translate([perc*(xl/num),0,0]){
yl=yl-far_border_length*yl;
xl=(xl/num)-perc*(xl/num);
rotate([rot,0,0]){
cube([xl,yl,zl]);
translate([xl/2,yl,0]) cylinder(h=z_length,r=xl/2, $fn=100);}
translate([xl/2,yl,-z_length]) rotate([0,0,90])cylinder(h=z_length*3,r=xl/2, $fn=100);
}}

module main_cube(){
cube([x_length,y_length,z_length]);
}

difference(){
main_cube();
for(i=[0:1:num]){
    xt=oneCellXlength*i-shift;
translate([xt,0,0]) cutfn(x_length,y_length,z_length,rot);
}
sphere_radius=x_length*3;
translate([x_length/2,y_length/3,sphere_radius+z_length/2]) sphere(sphere_radius, $fn=200);
}