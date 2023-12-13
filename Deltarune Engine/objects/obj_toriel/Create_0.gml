/// @desc
pause = false;

walkSpeed = 60 * global.dt;
runSpeed = 120 * global.dt;
running = false;
spd = walkSpeed;

moveX = 0;
moveY = 0;

//charSprite = char_sprite_create(global.charMapDarkKris);
charSprite = char_sprite_create(global.charMapToriel);
spr_override = false;
cutscene_started = false;

//follower_add(obj_frick);


with(obj_camera){
	mode = "char";
	obj = obj_toriel;
}

set_pause = function(_pause) {
	pause = _pause;
	running = false;
	image_index = 0;
	image_speed = 0;
	char_sprite_state_delay_frame(charSprite, "stand");
}
if room = rm_start {
	path = path_add();
	path_assign(path,PathToFrisk);
	do_anime(0, 1, 30, "linear", function(a) { image_alpha = a; });
	//create_anime(x).add(x+100, 60, "linear").start(function(a) { x = a; });

	x = 5.616173;
	y = 159.7561;
	char_sprite_dir(charSprite, 1, 0);

	call_later(40,time_source_units_frames,function(){
		char_sprite_state_delay_frame(charSprite, "walk");
		path_start(path,spd*2,path_action_stop,true);
	});
}else if room = rm_theaterEXT {
	path = path_add();
	path_assign(path,pathToTheater);
	do_anime(0, 1, 30, "linear", function(a) { image_alpha = a; });
	//create_anime(x).add(x+100, 60, "linear").start(function(a) { x = a; });

	x = 160;
	y = 520;
	char_sprite_dir(charSprite, 1, 0);

	call_later(40,time_source_units_frames,function(){
		char_sprite_state_delay_frame(charSprite, "walk");
		path_start(path,spd*2,path_action_stop,true);
	});
}