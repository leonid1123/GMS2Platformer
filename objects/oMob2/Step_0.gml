if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}

	hsp = 0;

}
x = x + hsp; //под вопросом

//Коллизия по y
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

vsp = vsp + grv; //гравитация

//состояия
if (idle == 1) {
	sprite_index = sMob2Idle;
	hsp=0;
}

if (run == 1) {
	sprite_index = sMob2Run;
	hsp = 1*dir;
	if (dir!=0) {
		image_xscale = dir;
	}
	
}
if (turn == 1) {
	sprite_index = sMob2Turn;
	hsp=0;
}

//переходы
