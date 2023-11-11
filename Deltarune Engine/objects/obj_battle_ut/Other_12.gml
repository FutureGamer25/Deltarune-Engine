/// @desc Buttons
spr_buttons = [	#region buttons					//list of button sprites.
	spr_battle_button_fight,					//if changed, keep to the 
	spr_battle_button_act,						//correct order.
	spr_battle_button_item,						//if you want more buttons
	spr_battle_button_mercy						//this will work...
];#endregion

button_total = array_length(spr_buttons);	//because of this will update by the amount above.
button_sel = 0;
button_draw = function(){
	for (var i = 0; i < button_total; ++i) {	//this will then run as many times button_total
		var button_frame = button_sel = i ? 1 : 0;
		draw_sprite(spr_buttons[i],button_frame,32+(i*153),432);
	}
	draw_sprite(spr_soul_battle,0,48+(button_sel*153),454);
}
next_state = BATTLE_UT.CHANGE;		//local vars won't work with the call_later function
//button change is a fail safe to prevent any input conflicts.
button_change = function(SFX=-1,_state){
	state = BATTLE_UT.CHANGE;
	if _state = BATTLE_UT.BUTTON_SEL {
		state_text = BATTLE_TEXT.NARRATION;
		inst_text.set_text(text);
	}
	next_state = _state;
	//if SFX != -1 SFX_play(SFX);
	call_later(1,time_source_units_frames,function(){state = next_state});
}

//standard switch statement to update the state depending on button selection
button_confirm = function(){
	switch(button_sel){
		case 0: //FIGHT
			button_change(snd_menu_confirm,BATTLE_UT.FIGHT_SEL);
			break;
		case 1: //ACTION
			button_change(snd_menu_confirm,BATTLE_UT.ACT_SEL);
			break;
		case 2: //ITEM
			button_change(snd_menu_confirm,BATTLE_UT.ITEM_SEL);
			break;
		case 3: //MERCY
			button_change(snd_menu_confirm,BATTLE_UT.MERCY_SEL);
			break;
	}
}



act_confirm = function(){
}

item_confirm = function(){
}

mercy_confirm = function(){
}




