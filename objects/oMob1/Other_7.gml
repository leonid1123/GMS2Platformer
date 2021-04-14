if (sprite_index==sDeath) {
image_speed = 0;
image_index = 14; 
hsp=0;
walk=0;
idle=0;
death=0;
dead=1;
}
if (sprite_index == sHit) {
walk=0;
idle=1;
death=0;
dead=0;
hit=0
canHit=1;
}