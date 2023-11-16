randomize();
global.dt = 1 / game_get_speed(gamespeed_fps);

#region window
//remember to set the size of rm_init to the scaled dimensions
//otherwise the screen may look weird for a second
global.camWidth = 320;
global.camHeight = 240;
global.camScale = 2 * game_get_max_scale(global.camWidth * 2, global.camHeight * 2);
//global.camScale = 2; //TODO: switch back
game_set_resolution(global.camWidth, global.camHeight, global.camScale);
#endregion

lang_set_newline("\\n");
lang_set_directory("english");
lang_file_load("object_interactions.txt");

#region overworld sprite maps
var map = char_map_create();
global.charMapFrick = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand",	spr_frisk_up,			spr_frisk_down,
							spr_frisk_side,			spr_frisk_side);
char_map_4dir(map, "walk",	spr_frisk_up_walk,		spr_frisk_down_walk,
							spr_frisk_side_walk,	spr_frisk_side_walk);
var map = char_map_create();
global.charMapToriel = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand",	spr_toriel_up,			spr_toriel_down,
							spr_toriel_side,		spr_toriel_side);
char_map_4dir(map, "walk",	spr_toriel_up_walk,		spr_toriel_down_walk,
							spr_toriel_side_walk,	spr_toriel_side_walk);
char_map_4dir(map, "talk",	spr_toriel_up,			spr_toriel_downT,
							spr_toriel_sideT,		spr_toriel_sideT);
var map = char_map_create();
global.charMapLightKris = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand",	spr_kris_light_up,		spr_kris_light_down,
							spr_kris_light_left,	spr_kris_light_right);
char_map_4dir(map, "walk",	spr_kris_light_up,		spr_kris_light_down,
							spr_kris_light_left,	spr_kris_light_right);

var map = char_map_create();
global.charMapDarkKris = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand",	spr_kris_dark_up,		spr_kris_dark_down,
							spr_kris_dark_left,		spr_kris_dark_right);
char_map_4dir(map, "walk",	spr_kris_dark_up,		spr_kris_dark_down,
							spr_kris_dark_left,		spr_kris_dark_right);

var map = char_map_create();
global.charMapLightSusie = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand",	spr_susie_light_up,		spr_susie_light_down,
							spr_susie_light_left,	spr_susie_light_right);
char_map_4dir(map, "walk",	spr_susie_light_up,		spr_susie_light_down,
							spr_susie_light_left,	spr_susie_light_right);

var map = char_map_create();
global.charMapDarkSusie = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand",	spr_susie_dark_up,		spr_susie_dark_down,
							spr_susie_dark_left,	spr_susie_dark_right);
char_map_4dir(map, "walk",	spr_susie_dark_up,		spr_susie_dark_down,
							spr_susie_dark_left,	spr_susie_dark_right);

var map = char_map_create();
global.charMapRalsei = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand",	spr_ralsei_up,		spr_ralsei_down,
							spr_ralsei_left,	spr_ralsei_right);
char_map_4dir(map, "walk",	spr_ralsei_up,		spr_ralsei_down,
							spr_ralsei_left,	spr_ralsei_right);







#endregion

#region dialog and text stuff
global.fontStruct = {
	"normal" : global.fontLarge,
	"arial" : font_arial
}

global.colorStruct = {
	"white" : c_white,
	"black" : c_black,
	"red" : c_red,
	"blue" : c_blue,
	"green" : c_lime
}

global.soundStruct = {
	"sans" : snd_dialog_sans,
	"harsh" : snd_dialog_harsh,
	"toriel" : snd_dialog_toriel
}

//global.owCharStruct = {
//	TR:	obj_toriel
//}

text_set_color_struct(global.colorStruct);
text_set_font_struct(global.fontStruct);
text_set_sound_struct(global.soundStruct);
text_set_silent_chars(" /n/t");
text_set_gain(0.5);

dialog_character("jeff", sprite_2, sprite_0, snd_dialog_sans, {
	happy : sprite_1,
	happy_talk : sprite_0,
	normal : sprite_2,
	normal_talk : sprite_0,
});
dialog_character("toriel", spr_toriel_port_happy, spr_toriel_port_happyT, snd_dialog_toriel, {
	happy : spr_toriel_port_happy,
	happy_talk : spr_toriel_port_happyT,
	srs : spr_toriel_port_srs,
	srs_talk : spr_toriel_port_srsT,
	rat : spr_toriel_port_rat,
	rat_talk : spr_toriel_port_ratT,
});
#endregion

depth_sort_set_layer("depth");
instance_create_depth(0, 0, 0, obj_game);

set_enemy_data();

room_goto_next();