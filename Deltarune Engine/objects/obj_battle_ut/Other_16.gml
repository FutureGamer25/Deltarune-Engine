/// @desc Fight

fight_type = obj_fight_bar_default


fight_sel = function(){
	inst_text.set_text("");
	state_text = BATTLE_TEXT.ENEMY_SEL;
}
fight_confirm = function(){
	state_text = BATTLE_TEXT.FIGHT_BAR;
	button_change(snd_menu_confirm,BATTLE_UT.FIGHT_CONFIRM);
	switch(fight_type){
		default:
		case "default":
			var rnd = irandom(1)
			rnd = 0;
			if rnd  = 0 {
				//starts to the right
				start_x = 40+562;
			}else {
				//starts to the left
				start_x = 40;
			}
			instance_create_layer(start_x,255+64,"UI",obj_fight_bar_default);
			break;
	}
}
fight_bar_setup = function(){
	bar_x = 40;
}
fight_bar_gameplay = function(){
	
}













