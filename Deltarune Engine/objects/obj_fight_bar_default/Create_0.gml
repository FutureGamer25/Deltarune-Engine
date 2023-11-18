/// @desc
if x = 40 {
	//starting left
	hmove = 9;
}else{
	//starting right
	hmove = -9;
}
speed = hmove;

xx = 0;
can_hit = true;
atk = 1;
damage = 0;
value = atk * 4;

destroy = function(){
	//obj_battle_ut.turn_end();
	obj_battle_ut.turn_end_to_combat();
	instance_destroy();
}

