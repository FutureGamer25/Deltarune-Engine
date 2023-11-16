/// @desc
event_inherited();
walkSpeed = 60 * global.dt;
runSpeed = 120 * global.dt;
running = false;
spd = walkSpeed;

charSprite = char_sprite_create(global.charMapToriel);
spr_update = true;

xxx=0;
yyy=0;

follower_add(obj_frick);

if room = rm_theaterEXT {
	path = path_add();
	path_assign(path,pathToTheater);
	do_anime(0, 1, 30, "linear", function(a) { image_alpha = a; });
	//create_anime(x).add(x+100, 60, "linear").start(function(a) { x = a; });

	x = 160;
	y = 540;
	char_sprite_dir(charSprite, 1, 0);

	call_later(40,time_source_units_frames,function(){
		
		path_start(path,spd,path_action_stop,true);
	});
}
char_sprite_state_delay_frame(charSprite, "walk");

with(obj_camera){
	mode = "char";
	obj = obj_player_toriel;
}