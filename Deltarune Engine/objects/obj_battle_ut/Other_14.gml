/// @desc Text
//NOTE: change how this is chosen later, because there could be mulitple enemies!
text = enemy[0].intro_text;

Set_Nara_Box();

inst_text = text_create();
text_set_newline_str(inst_text, "* ");
inst_text.set_text(text);


#region target size
_w = targ_w;
_h = targ_h;
_x = targ_x;
_y = targ_y;

_t = targ_t;
_l = targ_l;
_r = targ_r;
_b = targ_b;
#endregion

textbox_draw = function(){
	var _xx = _x-(_w/2)
	var _yy = _y-(_h/2)
	draw_sprite_stretched(spr_battle_box,1,_xx,_yy,_w,_h);
	
	switch(state_text){
		case BATTLE_TEXT.NARRATION:
			draw_set_font(font_dt_mono);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			text_draw(inst_text, 52, 270, -1, 220,2);
			break;
		case BATTLE_TEXT.ENEMY_SEL:
			draw_set_font(font_dt_mono);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			for (var i = 0; i < enemy_total; ++i) {
				inst_enemy[i].hp = 10;
				draw_text_transformed(52+36+12, 270 + (i*30),"* "+inst_enemy[i].name,2,2,0);
				draw_sprite_ext(spr_pixel,0,636/2,560/2,100,17,0,c_red,1);
				draw_sprite_ext(spr_pixel,0,636/2,560/2,(inst_enemy[i].hp/inst_enemy[i].max_hp)*100,17,0,#00ff00,1);
			}
			draw_sprite(spr_soul_battle,0,72,286 + (enemy_sel*30));
			
			break;
		case BATTLE_TEXT.FIGHT_BAR:
			draw_sprite(spr_attack_barUT,0,40,255);
			
			break;
	}
}

textbox_slerp = function(){
	_h = slerp_to(_h, targ_h, .9);
	_w = slerp_to(_w, targ_w, .9);
	_y = slerp_to(_y, targ_y, .9);
	_x = slerp_to(_x, targ_x, .9);
	var _www = _w/2
	var _hhh = _h/2
	_t = _y-_hhh
	_l = _x-_www
	_r = _x+_www
	_b = _y+_hhh
}