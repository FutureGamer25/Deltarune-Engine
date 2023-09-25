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
draw_text(23,68,text_money);
//text value
draw_text(41,50,value_lv);
draw_text(41,59,string(value_hp)+"/"+string(value_hp_max));
draw_text(41,67,value_money);
#endregion


#region box #2 Text
draw_set_font(font_dt_sans);
for (var i = 0; i < menu_total; ++i) {
	var col = c_white;
	if i = 0 {
		if item_lock col = c_grey;
	}else if i = 2 {
		if cell_lock col = c_grey;
	}
	draw_text_color(42,94+(i*18),menu_list[i],col,col,col,col,1);
	if menu_level = 0 draw_sprite(spr_menu_soul,0,32,102+(menu_select*18));
}
#endregion

if menu_level = 1 {
	
	switch(menu_select){
		case 0: //item
			//box
			draw_sprite_stretched(spr_textbox_light,0,94,26,173,209);
			
			for (var i = 0; i < item_total; ++i) {
				draw_text(116,44+(i*18),item_list[i]);
				draw_sprite(spr_menu_soul,0,106,52+(item_select*18));
			}
			draw_text(116		,184,item_choice[0]);
			draw_text(116+48	,184,item_choice[1]);
			draw_text(116+105	,184,item_choice[2]);
			
			if	item_choice_selection = 0		draw_sprite(spr_menu_soul,0,	106,192);
			else if item_choice_selection = 1	draw_sprite(spr_menu_soul,0,	106+48,192);
			else if item_choice_selection = 2	 draw_sprite(spr_menu_soul,0,	106+105,192);
			break;
		case 1: //stats
			//box
			draw_sprite_stretched(spr_textbox_light,0,94,26,173,212);
			
			draw_text(108,		42		,chr(34)+text_name+chr(34));
			
			draw_text(108,		72	,text_lv)
			draw_text(108+20,	72	,value_lv);
			draw_text(108,		72+16,text_hp);
			draw_text(108+20,	72+16,string(value_hp)+" / "+string(value_hp_max));
			
			draw_text(108,		72+48,at_text);
			draw_text(108+20,	72+48,string(value_at)+" ("+string(value_weapon_at)+")");
			draw_text(108,		72+48+16,df_text);
			draw_text(108+20,	72+48+16,string(value_df)+" ("+string(value_weapon_df)+")");
			
			draw_text(108+84,	72+48,exp_text+string(value_exp));
			draw_text(108+84,	72+48+16,next_text+string(value_next));
			
			draw_text(108,		72+48+16+30,weapon_text+weapon);
			draw_text(108,		72+48+16+30+16,armor_text+armor);
			
			draw_text(108,		72+48+16+30+16+20,money_text+string(value_money));
			break;
		case 2: //cell
			
			break;
	}
}
//TBD: DEBUG
//draw_text(40,10,"item_choice_selection: "+string(item_choice_selection))