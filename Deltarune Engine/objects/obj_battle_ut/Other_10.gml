/// @desc Stat Data
//TODO: MOVE LATER
global.player_name = "CHARA";
global.player_info = {
	name : global.player_name,
	hp : 20,
	hp_max : 20,
	lv : 1	
}
data_draw = function(){
	#region name
	draw_set_font(font_mars_needs_cunnilingus);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(30,413-12,global.player_info.name + "   LV " + string(global.player_info.lv));
	#endregion
	
	#region HP
	draw_sprite(spr_hp_ut,0,244,417-12)
	var hp_max_var = global.player_info.hp_max;
	var hp_var = global.player_info.hp;
	var hp_max = (hp_max_var * 1.25);
	var hp = (hp_var * 1.25);
	draw_sprite_ext(spr_pixel,0,275,412-12,1*hp_max,21,0,#fe0000,1);
	draw_sprite_ext(spr_pixel,0,275,412-12,1*hp,21,0,#F3F93C,1);
	draw_text(289+(hp_max),413-12,string(hp_max_var)+" / "+string(hp_var));
	/*
	HP bar is a single pixel sprite stretched to the HP value * 1.25.
	For a more complex bar, look into draw_sprite_stretched();
	*/
	#endregion
	
	fight_type = "default"
	
	#region Debug
	if debug {
		var st;
		var ts;
		switch(state){
			default: st = "OTHER"; break;
			case BATTLE_UT.INIT:
				st = "INIT";
				break;
			case BATTLE_UT.CHANGE:
				st = "CHANGE";
				break;
			case BATTLE_UT.BOARD_TRANS:
				st = "BOARD_TRANS";
				break;
			case BATTLE_UT.PRE_COMBAT_DIO:
				st = "PRE_COMBAT_DIO";
				break;
			case BATTLE_UT.PRE_COMBAT_NARA:
				st = "PRE_COMBAT_NARA";
				break;
			case BATTLE_UT.ACT_SEL:
				st = "ACT SELECTION";
				break;
			case BATTLE_UT.ACT_CONFIRM:
				st = "ACT CONFIRM";
				break;
			case BATTLE_UT.BUTTON_SEL:
				st = "BUTTON SEL";
				break;
			case BATTLE_UT.FIGHT_SEL:
				st = "FIGHT SEL";
				break;
			case BATTLE_UT.FIGHT_CONFIRM:
				st = "FIGHT CONFIRM";
				break;
			case BATTLE_UT.ITEM_SEL:
				st = "ITEM SEL";
				break;
			case BATTLE_UT.ITEM_CONFIRM:
				st = "CONFIRM";
				break;
			case BATTLE_UT.MERCY_SEL:
				st = "MERCY SEL";
				break;
			case BATTLE_UT.MERCY_CONFIRM:
				st = "CONFIRM";
				break;
			case BATTLE_UT.WIN:
				st = "WIN";
				break;
			case BATTLE_UT.LOSE:
				st = "LOSE";
				break;
		}
		switch(state_text){
			case BATTLE_TEXT.NARRATION:
				var ts = "Narration";
				break;
			case BATTLE_TEXT.ENEMY_SEL:
				var ts = "Enemy Sel";
				break;
			default:
				var ts = "What the hell"
				break;
		}
		draw_text(20,20,"state: "+st + " text: "+ts);
	}
	#endregion
}










