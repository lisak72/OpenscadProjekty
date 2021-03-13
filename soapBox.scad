
x_length=80;
y_length=70;
z_length=9;
rot=6; //angle of cuted segment
num=7; //number of cuted segment
perc=35;  //percent of cutted surface
oneCellXlength=x_length/num; //is computed


module cutfn(xl,yl,zl,rot){ //module cutter
perc=(10/perc);
translate([perc*(xl/num),0,0]){
yl=yl-0.2*yl;//math
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
    xt=oneCellXlength*i-1.1; //-0.5obfuscated, do it better!
//echo (xt);
translate([xt,0,0]) cutfn(x_length,y_length,z_length,rot);
}
}