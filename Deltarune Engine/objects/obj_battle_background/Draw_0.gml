draw_set_gui_2x();

draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_sprite_tiled_ext(battle_bg, 0, gridPos2 - 100, gridPos2 - 100, 1, 1, c_white, 0.5);
draw_sprite_tiled_ext(battle_bg, 0, gridPos1 - 200, gridPos1 - 210, 1, 1, c_white, 1);

draw_reset_gui_2x();