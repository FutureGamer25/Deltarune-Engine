randomize();

#region window
//remember to set the size of rm_init to the scaled dimensions
//otherwise the screen may look weird for a second
global.dt = 1 / room_speed;
global.view_width = 320;
global.view_height = 240;
global.view_scale = 2;
var width = global.view_width;
var height = global.view_height;
var scale = global.view_scale;

window_set_size(width * scale, height * scale);
window_center();
surface_resize(application_surface, width * scale, height * scale);
display_set_gui_size(width, height);
#endregion

lang_set_directory("english");
lang_file_load("object_interactions.txt");

#region overworld sprite maps
var map = char_map_create();
global.charMapPlayer = map;
char_map_default(map, "stand");
char_map_4dir(map, "stand", spr_player_up, spr_player_down, spr_player_left, spr_player_right);
char_map_4dir(map, "walk", spr_player_walk_up, spr_player_walk_down, spr_player_walk_left, spr_player_walk_right);
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
	"harsh" : snd_dialog_harsh
}

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
#endregion

instance_create_depth(0, 0, 0, obj_layer_sort_depth);

instance_create_depth(0, 0, 0, obj_game);

room_goto_next();