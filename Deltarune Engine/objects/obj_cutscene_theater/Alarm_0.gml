/// @desc
var cut = cutscene_create()
cutscene_run(cut);

scene_move_speed(obj_player_toriel,obj_player_toriel.x,172,1);
scene_move_speed(obj_player_toriel,obj_player_toriel.x-40,172,1);
scene_func(function(){
	with(obj_player_toriel){
		char_sprite_state_delay_frame(charSprite, "stand");
		char_sprite_dir(charSprite, 1, 0);
	}
	with(obj_frick){
		char_sprite_dir(charSprite, 1, 0);
		follow = false;
	}
});
scene_wait(10);
scene_move_speed(obj_frick,obj_frick.x-40,172+10,1);
scene_func(function(){
	with(obj_frick){
		char_sprite_state_delay_frame(charSprite, "stand");
		char_sprite_dir(charSprite, 1, 0);
	}
});
scene_wait(90);
scene_func(function(){
	with(obj_player_toriel){
		spr_update = false;
		sprite_index = spr_toriel_scared;
	}
	with(obj_frick){
		char_sprite_dir(charSprite, 0, 1);
	}
	audio_play_sound(snd_link_HYAH,1,false);
	do_anime(obj_player_toriel,obj_player_toriel.y,10,"", function(a) { image_alpha = a; });
});
scene_dialog("RAT")

scene_func(function(){
	instance_destroy(obj_frick);
	obj_player_toriel.sprite_index = spr_toriel_srs_run;
});
scene_move_speed(obj_player_toriel,120,172,4);
scene_move_speed(obj_player_toriel,120,316,4);
scene_wait(10);

//scene_move_speed(obj_sans,obj_sans.x,172,1);
//scene_move_speed(obj_sans,obj_sans.x-40,172,1);