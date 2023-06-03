if keyboard_check_pressed(vk_f4) {
	window_set_fullscreen(!window_get_fullscreen());
}

if debug {
	if keyboard_check_pressed(vk_f5) {
		save_game();
	}
	
	if keyboard_check_pressed(vk_f6) {
		load_game();
	}
	
	if keyboard_check_pressed(vk_f1) {
		overlay = !overlay;
		show_debug_overlay(overlay);
	}
}