//Кнопки
key_left = (keyboard_check(ord("A")) || keyboard_check(vk_left));
key_right = (keyboard_check(ord("D")) || keyboard_check(vk_right));
key_jump = (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up));

if (keyboard_check(ord("R"))) {
	room_restart();	
}

//Колизия по x
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
y = y + vsp; //под вопросом

vsp = vsp + grv; //гравитация

var move = key_right - key_left;

//////////////Состояния////////////////////////
if (idle == 1) {
	sprite_index = sPlayerIdle;
}

if (walk == 1) {
	part_particles_create(global.P_System, x+hsp*1.4, y-2, global.Particle1, 2);
	sprite_index = sPlayerRun;
	hsp = move * walksp;
	if (move!=0) {
		image_xscale = move;	
	} 
}
if (attack == 1) {
	hsp=0;
	sprite_index = sPlayerAttack1;
}

if (air == 1) {
	sprite_index = sPlayerAir;
	hsp = move * walksp;
	if (move!=0) {
    image_xscale = move;	
	} 
}

/////////////Переходы////////////////////////

//переход idle - walk
if (idle == 1 && move!=0) {
	walk = 1;
	idle = 0;
	air = 0;
	attack = 0;
}
// переход walk - idle
if (walk && move == 0) {
	walk = 0;
	idle = 1;
	air = 0;
	attack = 0;
}
//переход idle/walk - attack
if ((idle == 1 || walk==1)   && keyboard_check_pressed(vk_space)) {
	walk = 0;
	idle = 0;
	air = 0;
	attack = 1;	
}
//переход idle/walk - jump (отходим от правил, но состояние длится 1 кадр
if ( (idle==1 || walk==1) && place_meeting(x,y+1,oWall) && (key_jump))
{
	vsp = -6;
	
	walk = 0;
	idle = 0;
	air = 0;
	attack = 0;	
	
}
//переход в air из любого состояния
if (!place_meeting(x,y+1,oWall)) {
	walk = 0;
	idle = 0;
	air = 1;
	attack = 0;
	
}
//переход air - idle если горизонтальная скорость =0
if (air==1 && place_meeting(x,y+1,oWall) && hsp==0) {
	walk = 0;
	idle = 1;
	air = 0;
	attack = 0;
}
//переход air - walk если горизонтальная скоромть !=0 
if (air==1 && place_meeting(x,y+1,oWall) && hsp!=0) {
	walk = 1;
	idle = 0;
	air = 0;
	attack = 0;
}