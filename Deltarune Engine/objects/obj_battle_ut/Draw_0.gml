/// @desc
#region Debug (screenshot ref for quick cropping)
if debug {
	draw_line_width_color(0,0,room_width,0,4,c_blue,c_blue);
	draw_line_width_color(0,0,0,room_height,4,c_blue,c_blue);
	draw_line_width_color(0,room_height-2,room_width,room_height-2,4,c_blue,c_blue);
	draw_line_width_color(room_width-2,0,room_width-2,room_height,4,c_blue,c_blue);
}
#endregion

bg_draw();
data_draw();
button_draw();
textbox_draw();
draw_fight_bar();
