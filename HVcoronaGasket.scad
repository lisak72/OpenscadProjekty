difference(){
cube([160,180,4]);
translate([2,2,-1]) cube([156,176,6]);
  translate([8,4,2]) rotate([90,0,0])  cylinder(5,r=1,$fn=100);
}
