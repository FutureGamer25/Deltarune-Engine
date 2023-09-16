#region basic
function text_create(str = "") {
	var text = instance_create_depth(0, 0, 0, obj_text_handler);
	text.set_text(str);
	return text;
}

function text_destroy(text_obj) {
	instance_destroy(text_obj);
}

function text_draw(text_obj, _x, _y, sep = -1, w = -1, scale = 1) {
	text_obj.draw(_x, _y, sep, w, scale)
}

function text_set_text(text_obj, str) {
	text_obj.set_text(str);
}

function text_skip(text_obj) {
	text_obj.skip();
}

function text_is_finished(text_obj) {
	return text_obj.is_finished();
}

function text_set_style(text_obj, style) {
	text_obj.set_style(style);
}

function text_set_speed(text_obj, spd) {
	text_obj.set_speed(spd);
}

function text_set_sound(text_obj, sound) {
	text_obj.set_sound(sound);
}

function text_set_newline_str(text_obj, str) {
	text_obj.set_newline_str(str);
}
#endregion

#region custom commands / variables
function text_variable(name, value_or_func) {
	var v = value_or_func;
	global.text_data.func[$ name] = is_method(v) ? v : string(v);
}

function text_func(name, func) {
	__text_add_func_index(1, name, func);
}
#endregion

#region setup functions
function text_set_color_struct(struct) {
	global.text_data.color = struct;
}

function text_set_font_struct(struct) {
	global.text_data.font = struct;
}

function text_set_sound_struct(struct) {
	global.text_data.sound = struct;
}

function text_set_silent_chars(char_string) {
	global.text_data.silent = char_string;
}

function text_set_gain(gain) {
	global.text_data.gain = gain;
}
#endregion