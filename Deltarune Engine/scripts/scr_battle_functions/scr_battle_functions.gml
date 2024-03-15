function battle_start(enemy_or_array,bg=spr_battle_background,mus=bgm_battle_dr) {
	if (!is_array(enemy_or_array)) enemy_or_array = [enemy_or_array];
	set_pause(true, "battle");

	instance_create_depth(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		0,
		obj_battle,
		{
			enemies: enemy_or_array,
			battle_bg: bg,
			creator:id,
			bgm: mus
		}
	);
}

function battle_end() {
	instance_destroy(obj_battle);
	set_pause(false, "battle");
}

function battle_set_state(newStateName) {
	with (obj_battle)
	{
		battleState.change(newStateName);
	}
}

// TO BE IMPLEMENTED
function battle_get_party_count() {
	return array_length(obj_battle.party);
}

function battle_get_party() {
	return obj_battle.party;
}

function battle_get_enemy_count() {
	return 0;
}

function battle_get_enemies() {
	return [];
}

function battle_show_dialog(dialog_key) {
}

function battle_run_attack(attack_object) {
	// Runs attack, sets the attack parent
}

function battle_create_bullet() {
}
