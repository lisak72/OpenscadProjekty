///base shape
Length = 40;
Width = 50;
edge = 2;
thickness = 4;
////body form guides
RimHeight = 3;
BodyHeight = 120;
BaseHeight = 6;
Opening = 1.5;
$fn = 100;
////hex pattern guides
HLlength = 200;
Patternbegin = 28;
hexSize = 11.5;

base();
//difference(){
    body();
  //  HexPattern();
//}
//rim();

//////hex shape/////////////////////////////
/*
*rotate(90,[0,1,0]){
    circle(hexSize,$fn=6);
}
*/
////////////////////////////////////////////
////////////MODULES/////////////////////////
/////////////////////////

module BaseShape(solid){
    difference(){
        offset(20)
            minkowski(){
                square([40,50],true);
                circle(edge);
            }
        if (solid=="no"){
            offset(20-thickness){
                minkowski(){
                    square([Length,Width],true);
                    circle(edge);
                }
            }
        }
    }
}

module base(){
    translate([0,0,0]){
        linear_extrude(BaseHeight){
            BaseShape(solid="yea");
        }
    }
}

module rim(){
    translate([0,0,BodyHeight+BaseHeight]){
        linear_extrude(RimHeight){
            scale(Opening){
                BaseShape(solid="no");
            }
        }
    }
}

module body(){
    translate([0,0,BaseHeight]){
        linear_extrude(height=BodyHeight,scale=Opening){
            BaseShape(solid="no");
        }
    }
}

module hexlog(){
    translate([-HLlength/2,0,Patternbegin]){
        rotate(90,[0,1,0]){
            linear_extrude(HLlength){
                circle(hexSize,$fn=6);
            }
        }
    }
}

module hexPatternSingle(){
    hexlog();
    rotate(30,[0,0,1]){
        hexlog();
    }
    rotate(60,[0,0,1]){
        hexlog();
    }
    rotate(90,[0,0,1]){
        hexlog();
    }
    rotate(120,[0,0,1]){
        hexlog();
    }
    rotate(150,[0,0,1]){
        hexlog();
    }
}

module HexPattern(){
    hexPatternSingle();
    translate([0,0,hexSize*2]){
        rotate(15,[0,0,1]){
            hexPatternSingle();
        }
    }
    translate([0,0,hexSize*4]){
        rotate(30,[0,0,1]){
            hexPatternSingle();
        }
    }
    translate([0,0,hexSize*6]){
        rotate(45,[0,0,1]){
            hexPatternSingle();
        }
    }
}