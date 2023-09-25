function battle_start(enemy_or_array) {
	if (!is_array(enemy_or_array)) enemy_or_array = [enemy_or_array];
	instance_pause_all();
	instance_create_depth(0, 0, 0, obj_battle);
}

function battle_end() {
	instance_destroy(obj_battle);
	instance_unpause_all();
}