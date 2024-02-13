/// @description End the turn
damage = 1;

turn_end = function() {
	obj_battle_ut.turn_end();
	instance_destroy();
}