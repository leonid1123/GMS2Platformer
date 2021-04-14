global.P_System = part_system_create_layer("Player", false);
global.Particle1 = part_type_create();

//This defines the particles shape
part_type_shape(global.Particle1,pt_shape_smoke);
//This is for the size
part_type_size(global.Particle1,0.1,0.2,0,0.01);
//This sets its colour. There are three different codes for this
part_type_color1(global.Particle1,c_white);
//This is its alpha. There are three different codes for this
part_type_alpha1(global.Particle1,0.1);
//The particles speed
part_type_speed(global.Particle1,0.10,0.5,-0.10,0);
//The direction
part_type_direction(global.Particle1,0,360,0,40);
//This changes the rotation of the particle
part_type_orientation(global.Particle1,0,0,0,0,true);
//This is the blend mode, either additive or normal
part_type_blend(global.Particle1,1);
//this is its lifespan in steps
part_type_life(global.Particle1,5,15);