  $fn=100;
  rotate_extrude()
 minkowski(){ 
    polygon([[2,1],[1,0],[2,-1],[2.1,-1],[1.1,0],[2.1,1]]);
    circle(0.1);
     }