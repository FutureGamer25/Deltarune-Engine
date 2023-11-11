function UTbattle_start(enemy_array) {
	room_persistent = true;
	global.battle_paused_room = room;
	global.battle_enemy_struct_names = enemy_array;
	room_goto(rm_battle_UT);
	//FadeToRoom(rm_battle)
}