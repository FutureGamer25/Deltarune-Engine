draw_set_gui_2x();
for (var i=0; i<array_length(obj_battle.enemies); i++){
	draw_set_colour(c_white);
	draw_set_font(font_dt_mono);
	draw_text_transformed(x,y+(i*28),enemy_get(obj_battle.enemies[i]).name,2,2,0);
}
draw_reset_gui_2x();