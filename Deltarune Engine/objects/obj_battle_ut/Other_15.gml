/// @desc Fight

fight_type = obj_fight_bar_default


fight_sel = function(){
	inst_text.set_text("");
	state_text = BATTLE_TEXT.ENEMY_SEL;
}
fight_confirm = function(){
	state_text = BATTLE_TEXT.FIGHT_BAR;
	button_change(snd_menu_confirm,BATTLE_UT.FIGHT_CONFIRM);
	instance_create_layer(0,0,"UI",obj_fight_bar_UT);
}
fight_bar_setup = function(){
	bar_x = 40;
	bar_alpha = 0;
}
fight_bar_gameplay = function(){
	
}













