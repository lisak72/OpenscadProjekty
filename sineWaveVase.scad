//Mark Peeters sine wave vase generator
// CC-BY-NC-SA Mark G. Peeters 11-5-2017
//https://www.youmagine.com/designs/sine-wave-vase-generator
/*inspiration & math code was found here 
Customizable TRI Function Bracelet by mathgrrl
Published on August 3, 2014
www.thingiverse.com/thing:416336
Creative Commons - Attribution - Non-Commercial - Share Alike
*/
//sinwave-vase-2-1
//reduced inputs to basic list for each layer
//gobal inputs are lower in code

//WARNING LONG RENDER TIMES WITH SMALL STEPS

/*
the Vase is made using "pixels" which are really cylinders joining the top and bottom sine wave patterns
*/

//Individual lAYER SETTINGS///////////////////////////////////
layerh=20;//height of each section

p5=32;//4 layer period TOP
p4=16;// 3 layer period
p3=8;// 2 layer period
p2=4;// 1 layer period
p1=4;// 0 layer period BOTTOM

//GLOBAL SETTINGS//////////////////////////////////
print_solid=0;//make a solid vase to be used with vasemode printing, 0=make hollow vase
base=0.7;//ONLY USED if hollow is selected , this is the thickness of the base
/* [Size] */
diameter = 65; 
radius = diameter/2;
// radius of "pixels"
thickness = 0.8;
// sides for "pixels"
$fn = 10;	
// size of waves (low = shorter bumps, high = taller bumps)
amplitude = 3;
// (step size for sampling the curve; smaller means finer, larger can be cool low-poly)
    step = 0.5;// WARNING LONG RENDER TIMES WITH SMALL STEPS
// (muliplier to make ovals instead of circles; 1 = circle, less = inside oval, more = outside oval)
oval = 1;

/////////left over from mathgrrl bracelet formulas////////
/////////use at your own risk////////////////////////
// (to change from a bangle to a wrap; 0 = closed circle, more = open gap)
cut = 0;
/* NOT USED IN 2.0 
//(to twist while extruding; 0 = straight, more = twisted)
degrees = 0;
// (multiplier for flaring in/out during the extrude; 1 = straight up, less = closes up, more = opens up) 
flare = 1;	
*/
	
////////////////////////////////////////////
////////make stuff//////////////////////////
////////////////////////////////////////////

if (print_solid==1){//print solid
//1 layer
twoLayer_solid(layerh,p1,p2);
//2 layer
translate([0,0,layerh])twoLayer_solid(layerh,p2,p3);
//3 layer
translate([0,0,layerh*2])twoLayer_solid(layerh,p3,p4);
//4 layer
translate([0,0,layerh*3])twoLayer_solid(layerh,p4,p5);
}//end if print solid

if (print_solid==0){//print hollow
//1 layer
twoLayer_hollow(layerh,p1,p2);
//2 layer
translate([0,0,layerh])twoLayer_hollow(layerh,p2,p3);
//3 layer
translate([0,0,layerh*2])twoLayer_hollow(layerh,p3,p4);
//4 layer
translate([0,0,layerh*3])twoLayer_hollow(layerh,p4,p5);
//base
singleLayer_base(thickness,0,step,360,p1,oval,radius,amplitude,base);    
}//end if print hollow



//test visuals, uncomment both to check size setting tracing formula
//singleLayer(thickness,0,step,360,p1,oval,radius,amplitude);
//translate([0,0,1])singleLayer(.1,0,step,360,p1,oval,radius,amplitude);

////////////////////////////////////////////
////////functions and modules///////////////
////////////////////////////////////////////

// returns [x,y] points for sin wrapped on circle r    
//xyPoints(period,oval,radius,amplitude,t);
   function xyPoints(p,o,r,a,t) =  
   [ o*(r+a*sin(p*t))*cos(t),
     (r+a*sin(p*t))*sin(t)]; 

//!twoLayer_solid(10,40,30);
module twoLayer_solid(z,p1,p2) {  
    
 for (t=[cut: step: 360-cut]) { 
  hull() {
   translate(xyPoints(p1,oval,radius,amplitude,t)) cylinder(r=thickness,h=0.01);
   translate([0,0,z])translate(xyPoints(p2,oval,radius,amplitude,t)) cylinder(r=thickness,h=0.01);
      cylinder(r=thickness,h=z);
       }//end hull
   }
};//end mod twoLayer_solid

//!twoLayer_hollow(10,40,30);
module twoLayer_hollow(z,p1,p2) {  
    
 for (t=[cut: step: 360-cut]) { 
  hull() {
   translate(xyPoints(p1,oval,radius,amplitude,t)) cylinder(r=thickness,h=0.01);
   translate([0,0,z])translate(xyPoints(p2,oval,radius,amplitude,t)) cylinder(r=thickness,h=0.01);
      //cylinder(r=thickness,h=z);
       }//end hull
   }
};//end mod twoLayer_hollow

//!singleLayer_base(thickness,0,step,360,p1,oval,radius,amplitude,base);
module singleLayer_base(rad,start,step,end,p,o,r,a,base) {
 for (t=[start: step: end-step]) {
     hull(){
   translate(xyPoints(p,o,r,a,t)) cylinder(r=rad,h=base);
    cylinder(r=rad,h=base); }//end hull
//echo(t);   
   }
};//end mod singleLayer_base

//module singleLayer
//!singleLayer(thickness,0,step,360,p1,oval,radius,amplitude);
module singleLayer(rad,start,step,end,p,o,r,a) {
 for (t=[start: step: end-step]) {
   translate(xyPoints(p,o,r,a,t)) cylinder(r=rad,h=0.1);
//echo(t);   
   }
};//end mod singleLayer