
/* [Global] */

// Which one would you like to see?
part = "both"; // [top:Top only,bottom:Bottom Only,both:Top and Bottom]

precision = 1; // 1 is quite good, quality decreases to 0, 4 takes a while to calculate

cable = 5;
side_wall=1.5;
top_wall=1.5;

lip = true; // lip or Schattenfuge to help hide the seam

rect_body=false; // flat surfaces for easyer home printing or sleak mode ;)
buttons_shift=-1; //  3.63 classic

/* [Hidden] */

$fs=$fs/precision;
$fa=$fa/precision;

/* measurements from rt-pen */

l1=58.34;
w1=11.6;
h1=1.65;


// main PCB
module main_pcb() {
cube([l1,w1,h1]);
}

h2=3.46-h1;
l2=31.03;
w2=w1;
s2=20.03;

w3=5.94;
l3=23.1;
s3=1.8;
o3=3.7;

module display_active() {
     translate([s3,o3,h2/2])
    cube([l3,w3,h2]);
}

module display(c=0) {
// Display 
    difference() {
    cube([l2-c,w2,h2]);
   display_active();
};
}

l4a=12.22;
l4b=2.26;
d4=5;
h4=4.1;
w4=5.9;



module socket(r=true) {
// Socket
union() {
cube([l4a,w4,h4]);
    if(r)
    translate([0,w4/2,h4/2])
    rotate([0,90,0])
    translate([0,0,-l4b])
    cylinder(h=l4b,d=d4);
}
}

s5=13.0;

l5b=1.9;
l5a=4.56;

w5a=2.32;
w5b=1;
//h5=3.63-h1; //for buttons position change
h5=buttons_shift-h1;

// buttons

module button(knob=true) {
cube([l5a, w5a, h5]);
    if(knob)
translate([(l5a-l5b)/2,-w5b,0])
cube([l5b, w5b, h5]);
}

d6=cable; // 6
s6=6;
l6=20;

module cable(c) {
    translate([-s6,0,0])
    rotate([0,90,0])
    cylinder(h=l6+c,d=d6);
}

l7=10.5;
d7=9;

module tip(c,o) {
    rotate([0,90,0])
    cylinder(h=l7-c+2*o,d=d7);
}

s8=15;
h8=2;
l8=40;


bottom_grow=rect_body?(d7/2.0):0;


module bottom_parts() {
    mirror([0,0,1])cube([l8,w1,h8]);
}


// Main Thing

    if(part!= "both")
splitter(part);
    else {
        
        splitter("top");
        
        translate([0,w1*3,0]) rotate([180,0,0]) splitter("bottom");
    }


module rt_pen(c1=0,c2=0,cab=true,tip=true, knob=true,o=0) {
main_pcb();
translate([s2,0,h1]) display();
translate([0,(w1-w4)/2,-h4/2]) socket($fs=$fs/2, $fa=$fa/2);
translate([s5,0,h1]) button(knob);
translate([s5,w1,h1]) mirror([0,1,0])button(knob);
if(cab) translate([l1,w1/2,0]) cable(c2);
if(tip) translate([-l7+c1-l4b-o,w1/2,0]) tip(c1,o);
translate([s8,0,0]) bottom_parts();

}

module oring(p,r,w) {
    
    w=w+r;
    
translate([p, (w1)/2, 0])
scale([1,(w+1*side_wall)/w, (w+1*top_wall)/w])
rotate([0,90,0])
rotate_extrude()
translate([w, 0, 0])
circle(r = r,$fs=$fs/2, $fa=$fa/2);
}

module housing( fingertip=8) {
difference() {
hull()
minkowski() {
// the pen
    union() {
rt_pen(c1=side_wall, knob=false,$fs=$fs/2, $fa=$fa/2);
        #minkowski() {
// enclose the hot parts
    union() {
translate([s8,0,0]) bottom_parts();
      
        
//translate([l4b,w1/2,0]) tip(-l7,0);
    }
    difference() {
        air=max(0,bottom_grow-h8);
    scale([0.01,0.01,air/10]) 
        sphere(10,$fs=$fs/2, $fa=$fa/2); // use a larger sphere to create a flat surface with the tip side at the end.
        translate([-air,-air,0])      cube(2*air,false);
    }
}

// make display surface flat!
if(rect_body)
translate([s2,0,d7/2-h2]) display();

    }
    
    // sphere that makes the wall
    scale([side_wall, side_wall, top_wall])
    sphere(1,$fs=$fs/2, $fa=$fa/2);
}
// the board
minkowski() {
rt_pen(c2=1.5*side_wall,o=0.5);
    sphere(0.1,$fs=$fs*2, $fa=$fa*2);
}

// space for parts
#hull() {
minkowski() {
    union() {
translate([s8,0,0]) bottom_parts();
      
        
//translate([l4b,w1/2,0]) tip(-l7,0);
    }
    difference() {
        air=max(0, bottom_grow-h8);
        echo(bottom_grow);
        echo(h8);
        echo(air);
    scale([0.01,0.01,air/10]) 
        sphere(10,$fs=$fs/2, $fa=$fa/2);
        translate([-air,-air,0])      cube(2*air,false);
    }
}

minkowski() {
    union() {
translate([0,(w1-w4)/2,-h4/2]) socket(false);
    }
    sphere(1,$fs=$fs*2, $fa=$fa*2);
}

minkowski() {
    union() {
translate([s5,0,h1]) button(false);
translate([s5,w1,h1]) mirror([0,1,0])button(false);
    }
    sphere(0.1,$fs=$fs*2, $fa=$fa*2);
}
}

// display cutout
hull()
{
    translate([s2,0,h1]) display_active();
    translate([s2-1,0,d7/2+h1+h2]) display(2);
}

// buttons
translate([s5 + w5a,-fingertip,h1+h5/2]) sphere(fingertip,$fs=$fs/2, $fa=$fa/2);
translate([s5 + w5a,w1+fingertip,h1+h5/2]) mirror([0,1,0])sphere(fingertip,$fs=$fs/2, $fa=$fa/2);

// clamps
oring(l1+l6/2,1.5,(d6)/2);

oring(-l7/2,1.5,(d7)/2-0.5);


}
}

module splitter(part) {
 difference() {
     housing();
if(lip) {if(part !="top") 
{
    
    difference() {
translate([-50,-50,0]) cube([200,200,100]);
    intersection() {
hull()
minkowski() {
rt_pen(c1=side_wall, knob=false);
    sphere((side_wall-0.1)/2);
}

    translate([-50,-50,h1/2-100]) cube([200,200,100]);
}
}
}
else {
    union() {
    translate([-50,-50,-100]) cube([200,200,100]);
        intersection() {
hull()
minkowski() {
rt_pen(c1=side_wall, knob=false);
    sphere((side_wall+0.1)/2);
}

translate([-50,-50,h1/2-100]) cube([200,200,100]);
}
}
}
}
else 
    
 {if(part !="top") 
translate([-50,-50,h1/2]) cube([200,200,100]);
     else 
     
    translate([-50,-50,h1/2-100]) cube([200,200,100]);
 }
}
 }   
    
