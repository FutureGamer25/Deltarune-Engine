function draw_set_gui_2x() {
	display_set_gui_size(global.camWidth * 2, global.camHeight * 2);
	draw_set_gui();
}

function draw_reset_gui_2x() {
	draw_reset_gui();
	display_set_gui_size(global.camWidth, global.camHeight);
}