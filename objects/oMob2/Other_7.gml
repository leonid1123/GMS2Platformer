///@description to run from turn
if (sprite_index == sMob2Turn) {
	run = 1;
	turn = 0;
	idle = 0;
	dir=-dir;
	image_index = 17 ;
	alarm_set(0,30);
}