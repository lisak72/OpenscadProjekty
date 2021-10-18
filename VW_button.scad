  $fn=100;
  weight=23;
  h=18;
  middle=13;
  screwh=16;
  screwd=4;
//compute
mweight=weight/2;
mh=h/2;
mmiddle=middle/2;



module mainbutton(){
//mirror([0,0,1])
{
union(){
hull() rotate_extrude(){
  minkowski(){ 
     polygon([[mweight,mh],[mmiddle,0],[mmiddle+0.1,0],[mweight+0.1,mh]]);
    circle(0.1);
     }}
     translate([0,0,mh]) cylinder(r=mweight);
     cylinder(d=middle);
}
}
}

module screwhole(){
translate([0,0,(h-screwh)]) cylinder(h=screwh,d=screwd, center=true);
}

module mainbutton2(){
mainbutton();
mirror([0,0,1]) mainbutton();
}

difference(){
mainbutton2();
screwhole();
}