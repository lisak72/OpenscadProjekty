delka=10;
delka_strany=11;
uhel=10;
tloustka=2;
vyska=5;
prodlouzeni=50;
union(){
translate([tloustka-prodlouzeni/2,0,0])cube([delka+prodlouzeni,tloustka,vyska]);//spojka
translate([delka+tloustka,0,0]) rotate([0,0,uhel]) cube([tloustka,delka_strany,vyska]); //druhy bok
translate([0,0,0]) rotate([0,0,-uhel]) cube([tloustka,delka_strany,vyska]); //prvni bok 
}
