/// @description Insert description here
var cut = cutscene_create();
audio_play_sound(Well_that_certainly_was_an_Undertale_Event_2,1,false);
scene_wait(60*2);
scene_func(function(){
	with(obj_end_sans){
			sprite_index = spr_sans_awake;
			image_index = 0;
			image_speed = 1;
	}
});
scene_wait(60);
scene_func(function(){
	with(obj_end_sans){
			image_index = 4;
			image_speed = 0;
	}
});
scene_wait(30);
scene_func(function(){
	with(obj_end_gaster){
			sprite_index = spr_gaster_def;
			image_index = 0;
			image_speed = 0;
	}
	with(obj_end_sans){
			sprite_index = spr_sans_getup;
			image_index = 0;
			image_speed = 0;
	}
});
scene_wait(10);
scene_dialog("final scene 0",true);
scene_func(function(){
	with(obj_end_sans){
			sprite_index = spr_sans_getup;
			image_index = 0;
			image_speed = 1;
	}
});
scene_wait(60*3);
scene_func(function(){
	with(obj_end_sans){
			sprite_index = spr_sans_sit_nuetral;
			image_index = 0;
			image_speed = 0;
	}
});
scene_dialog("final scene 1",true);
scene_func(function(){
	audio_play_sound(mus_dooropen,1,false);
	sequence = layer_sequence_create("Door",73,139,seq_octo_rusty);
	with(obj_end_gaster){
			sprite_index = spr_gaster_callback;
			image_index = 0;
			image_speed = 1;
	}
})
scene_wait(60);
scene_func(function(){
	audio_play_sound(mus_doorclose,1,false);
		with(obj_end_gaster){
			sprite_index = spr_gaster_def;
			image_index = 0;
			image_speed = 0;
	}
	layer_sequence_destroy(sequence);
});
scene_wait(30);
scene_dialog("final scene 2",true);
scene_wait(10);
scene_func(function(){
	with(obj_end_gaster){
			image_alpha = .9;
	}
});
scene_wait(2);
scene_func(function(){
	with(obj_end_gaster){
			image_alpha = .8;
	}
});
scene_wait(2);
scene_func(function(){
	with(obj_end_gaster){
			image_alpha = .6;
	}
});
scene_wait(4);
scene_func(function(){
	with(obj_end_gaster){
			image_alpha = .4;
	}
});
scene_wait(2);
scene_func(function(){
	with(obj_end_gaster){
			image_alpha = .2;
	}
});
scene_wait(2);
scene_func(function(){
	with(obj_end_gaster){
			image_alpha = .0;
	}
});
scene_wait(60);
scene_func(function(){
	with(obj_end_sans){
			sprite_index = spr_share;
			image_index = 0;
			image_speed = 0;
	}
});
scene_wait(4);
scene_func(function(){
	with(obj_end_sans){
		image_index = 1;
	}
});
cutscene_run(cut);