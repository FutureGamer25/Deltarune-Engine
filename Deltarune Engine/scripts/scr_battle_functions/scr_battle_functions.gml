function battle_start(enemy_or_array,bg=spr_battle_background,mus=bgm_battle_dr) {
	if (!is_array(enemy_or_array)) enemy_or_array = [enemy_or_array];
	instance_pause_all();
	instance_create_depth(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),0,obj_battle,{enemies: enemy_or_array,battle_bg: bg,creator:id,bgm: mus});
}

function battle_end() {
	instance_destroy(obj_battle);
	instance_unpause_all();
}