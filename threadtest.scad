extrusion_inner_radius = 5;
max_extrusion_radius = 10;
thread_spacing = 6;
num_turns = 3;

epsilon = 0.005;
helix_slices=35;
extrusion_slices=20;
vertical_section = [[1,1], [0,0.5], [0,-0.5], [1,-1]];



module thread() {
	helix_arm=[[0,0],[0,epsilon],[max_extrusion_radius,epsilon],[max_extrusion_radius,0]];
	
	linear_extrude(height=num_turns*thread_spacing, twist = num_turns*360)
	projection()
	intersection(){
		rotate_extrude(convexity=10, $fn=40, slices=extrusion_slices)
		translate([extrusion_inner_radius,0,0])
		polygon(points=vertical_section);

		translate([0,0,-thread_spacing/4])
		linear_extrude(height=thread_spacing/2, twist=180, convexity=10, slices=helix_slices)
		polygon(points=helix_arm);
	}
}

module wedge() {
	translate([0,0,-epsilon])
	intersection() {
		cube(100);
		rotate([0,0,80])
		cube(100);
	}
}

thread(){}
wedge(){}