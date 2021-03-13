
x_length=80;
y_length=70;
z_length=19;
rot=16; //angle of cuted segment
num=5; //number of cuted segment
perc=45;  //percent of cutted surface
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
translate([xl/2,yl,0]) cylinder(h=z_length,r=xl/2, $fn=100);
}}}

module main_cube(){
cube([x_length,y_length,z_length]);
}

difference(){
main_cube();
for(i=[0:1:num]){
    xt=oneCellXlength*i-shift;
translate([xt,0,0]) cutfn(x_length,y_length,z_length,rot);
}
}