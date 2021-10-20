  $fn=100;
  minkowski_f=3.25;
  weight=23;
  h=18;
  middle=13;
  screwh=16;
  screwd=6;
  nutd=12;
  nuth=8;
//compute
mweight=weight/2-minkowski_f;
mh=h/2;
mmiddle=middle/2-minkowski_f;



module mainbutton(){
//mirror([0,0,1])
union(){
hull() rotate_extrude(){
  minkowski(){ 
     polygon([[mweight,mh],[mmiddle,0],[mmiddle+0.1,0],[mweight+0.1,mh]]);
    circle(minkowski_f);
     }}
     translate([0,0,mh]) cylinder(r=mweight);
     cylinder(d=middle);
}
}


module screwhole(){
translate([0,0,(h-screwh)]) cylinder(h=screwh,d=screwd, center=true);
}

module nuthole(){
  translate([0,0,(h-nuth)]) cylinder(h=nuth,d=nutd,center=true);
}

module mainbutton2(){
mainbutton();
mirror([0,0,1]) mainbutton();
}

difference(){
mainbutton2();
screwhole();
nuthole();
}