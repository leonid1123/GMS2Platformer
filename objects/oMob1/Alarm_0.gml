if (death==0) {
	if (idle == 1) {
		idle=0;
		walk=1;
	} else if (walk == 1) {
		idle=1;
		walk=0;
	}
	alarm_set(0,660);
}