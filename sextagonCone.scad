hh=11;
rs=13.5;
rh=14.5;
insided=6.0;
sides=6;

difference(){
cylinder(h=hh, r1=rh/2, r2=rs/2, $fn=sides);
rotate([0,0,20]) cube([insided,insided,hh*3],center=true);
}