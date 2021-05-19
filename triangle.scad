    cf=3;
    b = 35*cf;
    h = 10*cf;
    w = 20*cf;
    

    //Start with an extruded triangle
    rotate(a=[90,-90,0])
    linear_extrude(height = w, center = true, convexity = 10, twist = 0)
    polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);