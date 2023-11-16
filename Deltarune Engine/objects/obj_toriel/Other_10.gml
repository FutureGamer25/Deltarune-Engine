/// @desc RM_start
if !cutscene_started {
		char_sprite_state_delay_frame(charSprite, "stand");
		if !instance_exists(obj_dialog) {
			var cut = cutscene_create();
	
			scene_dialog("start_scene");
			scene_func(function(){
				with(obj_player){
					char_sprite_dir(charSprite, 1, 0);
				}
			});
			scene_wait(60*1);
			scene_func(function(){
				with(obj_toriel) {
					cutscene_started = true;
					spr_override = true;
					sprite_index = spr_toriel_extra;
					audio_play_sound(snd_crack,1,false);
				}
			});
			scene_wait(60*1);
			scene_func(function(){
				with(obj_toriel) {
					spr_override = false;
				}
				with(obj_player){
					char_sprite_dir(charSprite, -1, 0);
				}
			});
			scene_dialog("toriel_scolds_frisk");
			scene_func(function(){
				with(obj_toriel) {
					spr_override = true;
					sprite_index = spr_toriel_side_pull;
					path_start(path,-(spd*2),path_action_stop,true);
				}
			});
			scene_func(function(){
				instance_destroy(obj_player);
			});
			cutscene_run(cut);
		}
	}else{
		do_anime(1, 0, 10, "linear", function(a) { image_alpha = a; });
		call_later(10,time_source_units_frames,function(){
			
			instance_destroy();
			room_fade(rm_theaterEXT);
		})
	}