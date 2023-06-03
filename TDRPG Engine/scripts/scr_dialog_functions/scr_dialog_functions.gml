#macro __dialog_box_width 176
#macro __dialog_box_height 56
#macro __dialog_box_sep 16

function dialog_start(lang_key, top_of_screen = undefined, pause = true) {
	var inst = dialog_create(lang_get_array(lang_key), top_of_screen);
	inst.check_inputs();
	if pause {
		instance_pause_all();
		inst.set_end_method(function() { instance_unpause_all(); });
	}
	return inst;
}

function dialog_create(str_or_array, top_of_screen = undefined) {
	if is_undefined(top_of_screen) {
		top_of_screen = false;
		if instance_exists(obj_player) {
			var pos = obj_player.y - camera_get_view_y(view_get_camera(0));
			if (pos > (global.view_height / 2 + 16)) top_of_screen = true;
		}
	}
	
	var inst = instance_create_depth(0, 0, 0, obj_dialog);
	__dialog_default_transform(inst, top_of_screen);
	inst.set_text(str_or_array);
	return inst;
}

function __dialog_default_transform(dialog_obj, top_of_screen) {
	var w = __dialog_box_width;
	var h = __dialog_box_height;
	var sep = __dialog_box_sep;
	with dialog_obj {
		x = (global.view_width - w) / 2;
		y = top_of_screen ? sep : (global.view_height - h - sep);
		set_size(w, h);
	}
}

function dialog_func(name, func) {
	global.dialog_data.func[$ name] = func;
}

function dialog_character(char_name, default_face_spr, default_talk_spr = default_face_spr, talk_sound = -1, face_struct) {
	global.dialog_data.char[$ char_name] = {
		sound : talk_sound,
		face : face_struct,
		defaultFace : default_face_spr,
		defaultTalk : default_talk_spr
	};
}

#region init
global.dialog_data = {
	func : {},
	char : {
		none : undefined
	}
}
#endregion