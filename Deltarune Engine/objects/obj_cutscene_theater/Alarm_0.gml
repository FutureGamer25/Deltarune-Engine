/// @desc
var cut = cutscene_create()
cutscene_run(cut);
#region Toriel

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

scene_wait(10);
scene_func(function(){
	instance_create_depth(193,89,0,obj_spider_atk);
	audio_play_sound(snd_random_spooky_gaster_spider,1,false);
});
scene_wait(60);

scene_func(function(){
	with(obj_player_toriel)instance_change(obj_torielsad,true);
});
scene_func(function(){
	with(obj_frick){
		char_sprite_state_delay_frame(charSprite, "stand");
		char_sprite_dir(charSprite, 1, 0);
	}
	with(obj_torielsad){
		char_sprite_state_delay_frame(charSprite, "stand");
		char_sprite_dir(charSprite, 0, -1);
	}
});

scene_wait(30);
scene_func(function(){
	with(obj_frick){
		char_sprite_state_delay_frame(charSprite, "stand");
		char_sprite_dir(charSprite, 0, -1);
	}
});
scene_wait(30);
scene_wait(30);

scene_func(function(){
	instance_destroy(obj_frick);
	obj_torielsad.spr_update = false;
	obj_torielsad.sprite_index = spr_toriel_srs_run;
	audio_play_sound(snd_flee,1,false);
});


scene_move_speed(obj_torielsad,120,172,4);
scene_move_speed(obj_torielsad,120,316,6);
scene_wait(1);
scene_func(function(){
	instance_destroy(obj_torielsad);
});
scene_wait(60);

#endregion

scene_move_speed(obj_sans,obj_sans.x,172,1);
scene_func(function(){
	with(obj_sans) char_sprite_dir(charSprite, 0, -1);
});
scene_wait(6);
scene_func(function(){
	with(obj_sans) {
		spr_update = false;
		sprite_index = spr_sans_shrug;
		audio_play_sound(snd_Sitcom_Laugh_Track,1,false);
	}
	audio_sound_gain(bgm,0,1);
});
scene_branch_start();
scene_wait(60*3);
scene_func(function(){
	audio_play_sound(bgm_sans,1,true);
});
scene_branch_end();
//NOTE TO SELF: VIDEO ZOOM IN
scene_wait(60*4);
scene_func(function(){
	with(obj_sans) {
		spr_update = true;
		char_sprite_dir(charSprite, 0, -1);
	}
});
scene_dialog("theater_start",true);
scene_lerp_func(0,1,60,"linear",function(_x){
	obj_gaster.image_alpha = _x;
});
scene_wait(30);
scene_func(function(){
	with(obj_sans) {
		char_sprite_dir(charSprite, 0,-1);
	}
});
scene_dialog("man stand");
scene_func(function(){
	with(obj_sans) {
		spr_update = false;
		sprite_index = spr_sans_shrug;
		audio_pause_all();
		audio_play_sound(snd_scifeild,1,false);
	}
});
scene_wait(60*1);

scene_func(function(){
	with(obj_sans) {
		spr_update = true;
		char_sprite_dir(charSprite, 0, -1);
	}
	instance_unpause_all();
});
scene_dialog("sans orders");
scene_func(function(){
	with(obj_gaster) {
		sprite_index = spr_gaster_lemonaid;
	}
});
scene_wait(90);
scene_func(function(){
	with(obj_gaster) {
		sprite_index = spr_gaster_singles;
		image_index = 0;
	}
	with(obj_sans) {
		spr_update = false;
		sprite_index = spr_sans_lemonaid;
		audio_play_sound(snd_SLURP,1,false);
	}
});
scene_wait(60*2);
scene_func(function(){
	with(obj_sans) {
		spr_update = true;
	}
});
scene_dialog("sans cool");
scene_move_speed(obj_sans,obj_sans.x-60,172,1);
scene_wait(10);
scene_dialog("sans waita sec",true);
scene_wait(10);
scene_func(function(){
	with(obj_gaster) {
		image_index = 1;
	}
});
scene_wait(10);
branch = scene_branch_start();
scene_func(function(){
	xx=obj_gaster.x;
})
scene_func_repeat(function(){
	obj_gaster.x = irandom_range(-1,1)+xx;
});
scene_branch_end();
scene_dialog("gaster waita shocked",false);
scene_branch_pause(branch);
scene_func(function(){
	with(obj_gaster) {
		image_index = 3;
	}
});
scene_wait(10);
scene_func(function(){
	with(obj_sans) {
		char_sprite_dir(charSprite,1, 0);
	}
});
scene_dialog("sans cool");

scene_move_speed(obj_sans,obj_sans.x,172,1);
scene_func(function(){
	with(obj_sans) {
		char_sprite_dir(charSprite, 0, -1);
	}
});
scene_func(function(){
	with(obj_gaster) {
		sprite_index = spr_gaster_duck;
		image_index = 0;
	}
});
scene_lerp_func(0,4,30,"linear",function(_x){
	obj_gaster.image_index = _x;
});
scene_wait(10);
scene_func(function(){
	with(obj_gaster) {
		sprite_index = spr_gaster_singles;
		image_index = 4;
		audio_play_sound(snd_Zelda_Get_Item,1,false);
	}
});
scene_wait(60);
scene_func(function(){
	with(obj_gaster) {
		sprite_index = spr_gaster_bat
	}
});
scene_lerp_func(0,3,6,"linear",function(_x){
	obj_gaster.image_index = _x;
		audio_play_sound(snd_bat_hit,1,false);
});
scene_wait(4);
scene_func(function(){
	room_goto(rm_bullshit);
});