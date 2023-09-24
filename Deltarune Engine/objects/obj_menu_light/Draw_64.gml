/// @desc Menu
#region box
draw_sprite_stretched(spr_textbox_light,0,16,26,71,55);
draw_sprite_stretched(spr_textbox_light,0,16,84,71,74);
#endregion

#region box #1 Text
draw_set_font(font_dt_sans);
draw_text(23,34-4,text_name);
draw_set_font(font_crypt_of_tomorrow);
//text title
draw_text(23,50,text_lv);
draw_text(23,59,text_hp);
draw_text(23,68,text_dollar);
//text value
draw_text(41,50,value_lv);
draw_text(41,59,value_hp);
draw_text(41,67,value_dollar);
#endregion


#region box #2 Text
draw_set_font(font_dt_sans);
for (var i = 0; i < menu_total; ++i) {
	var col = cell_lock && i = 2 ? c_grey : c_white;
	draw_text_color(42,94+(i*18),menu_list[i],col,col,col,col,1);
	draw_sprite(spr_menu_soul,0,32,102+(menu_select*18));
}
#endregion