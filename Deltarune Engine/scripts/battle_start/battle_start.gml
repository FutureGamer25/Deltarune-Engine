function battle_start(enemy_or_array) {
	if (!is_array(enemy_or_array)) enemy_or_array = [enemy_or_array];
	global.enemyArray = enemy_or_array;
	room_goto(rm_battle);
}