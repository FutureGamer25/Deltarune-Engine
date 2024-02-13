///@desc Turns
turn_end= function(narration){
	//button_change(-1,BATTLE_UT.BUTTON_SEL); //debug sets to start fo turn
	Set_Nara_Box();
	turn_new_narration();
	with(obj_battle_soul) instance_destroy(obj_battle_soul);
	state_text = BATTLE_TEXT.NARRATION;
	narration = "Reaction Narration";
	textbox_set(narration);
	button_sel = 0;
}

turn_end_to_combat = function(){ //when fighting no narration i think?
	button_change(-1,BATTLE_UT.PRE_COMBAT_DIO);
	state_text = BATTLE_TEXT.NONE;
	button_sel = 0;
}

turn_pre_combat_dio = function(){
	//TODO: update later to account for multiple enemies
	var enemy_dio = instance_create_layer(inst_enemy[0].x+40,inst_enemy[0].y-40,"UI",obj_enemy_dio);
		enemy_dio.text = "TEST";
	
	Set_Battle_Box();
	var _xx = targ_x;
	var _yy = targ_y;
	instance_create_layer(_xx,_yy,"SOUL",obj_battle_soul);
	button_change(-1,BATTLE_UT.BOARD_TRANS);
}
turn_board_trans = function(){
	//TODO: enemy turn should define box size
	if targ_w = _w {
		//TODO: mulptiple enemeies bles bla bla bla
		with(obj_enemy_dio) instance_destroy(obj_enemy_dio);
		inst_enemy[0].enemy_attack();
		button_change(-1,BATTLE_UT.COMBAT_START);
	}
}

turn_new_narration = function(){
	text = inst_enemy[0].enemy_narration();
	inst_text.set_text(text);
	button_change(-1,BATTLE_UT.BUTTON_SEL);
	show_debug_message("what the fuuuuuuck");
}