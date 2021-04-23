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
y = y + vsp;

vsp = vsp + grv; //гравитация
//sprite flip
	if (dir>0) {
		image_xscale = 1;	
	} else if (dir<0) {
		image_xscale = -1;	
	}

//LOS to player
dst = distance_to_object(oPlayer);
if (dst<=150) {
	pl = collision_line(x,y-32,oPlayer.x,oPlayer.y-32,oWall,false,true);
	if (pl=noone && (walk=1 || idle=1)) {
		idle=0;
		walk=0;
		walkToPlayer=1;	
	} 
	if (pl!=noone && walkToPlayer==1) {
		idle=1;
		walkToPlayer=0;
	}	
} else if (walkToPlayer == 1) {
pl=noone;
walkToPlayer = 0;
idle=1;
}

//damage from player
if (canHit==1 && place_meeting(x,y,oPlayer) && oPlayer.sprite_index==sPlayerAttack1 && floor(oPlayer.image_index)=2) {
hsp=0;

hp-=(oPlayer.dmg/armor + oPlayer.fireDmg/fireArmor) ;


walk=0;
idle=0;
attack=0;
walkToPlayer=0;
hit=1;
sprite_index = sHit;
canHit=0;
}

if (idle ==1) {
	sprite_index = sIdle;
	hsp=0;
}

if (walk=1) {
	sprite_index = sWalk;
	hsp = 0.5*dir;
	if (place_meeting(x+dir,y,oWall) || !place_meeting(x+dir*25,y+1,oWall))
	{
		dir = -dir;	
	}
}

if (hp<=0) {
hsp=0;
walk=0;
idle=0;
hit=0;
death=1;
sprite_index=sDeath;
if (create=0) {
	create=1;
	randomize();
	var choise = random(1);
	if (choise>0.66) {
		instance_create_layer(x,y-70,"Player",oCoin);
	} else if (choise>=0.25 && choise<0.75) {
		instance_create_layer(x,y-70,"Player",oPotion);
	}
}

}

if (walkToPlayer==1) {
	sprite_index = sWalk;
	var whereToGo = oPlayer.x-x;
	if (whereToGo>0) {
		dir=1;
	}
	if (whereToGo<0) {
		dir=-1;
	}
	hsp = dir*0.9;
}