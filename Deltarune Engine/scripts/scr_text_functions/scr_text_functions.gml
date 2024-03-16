#region basic
function text_create(str = "") {
	var text = instance_create_depth(0, 0, 0, obj_text_handler);
	text.set_text(str);
	return text;
}

function text_destroy(text_obj) {
	instance_destroy(text_obj);
}

function text_draw(text_obj, _x, _y, xscale = 1, yscale = 1, angle = 0) {
	text_obj.draw(_x, _y, xscale, yscale, angle)
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

function text_set_font(text_obj, font) {
	text_obj.set_font(font);
}

function text_set_wrap(text_obj, width = -1) {
	text_obj.set_wrap(width);
}

function text_set_line_sep(text_obj, sep = -1) {
	text_obj.set_line_sep(sep);
}

function text_set_effect(text_obj, effect_name, parameters = []) {
	text_obj.set_effect(effect_name, parameters);
}

function text_set_render_func(text_obj, func) {
	text_obj.set_render_func(func);
}

function text_set_sound_func(text_obj, func) {
	text_obj.set_sound_func(func);
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

function text_get_width(text_obj) {
	return text_obj.get_width();
}

function text_get_height(text_obj) {
	return text_obj.get_height();
}

function text_get_line_count(text_obj) {
	return text_obj.get_line_count();
}
#endregion

#region custom commands / variables
function text_add_variable(name, value_or_func) {
	var v = value_or_func;
	__text_add_command_type(name, "variable", is_method(v) ? v : string(v));
}

function text_add_func(name, func) {
	__text_add_command_type(name, "type", func);
}

function text_add_transform_effect(name, func) {
	__text_add_command_type(name, "transform", func);
	__text_add_command_type("/" + name, "transform", "reset");
}

function text_add_render_effect(name, func) {
	__text_add_command_type(name, "render", func);
	__text_add_command_type("/" + name, "render", "reset");
}
#endregion

#region setup functions
function text_set_color_struct(struct) {
	global.__text_data.color = struct;
}

function text_set_font_struct(struct) {
	global.__text_data.font = struct;
}

function text_set_sound_struct(struct) {
	global.__text_data.sound = struct;
}

function text_set_silent_chars(char_string) {
	global.__text_data.silent = char_string;
}

function text_clear_char_delay() {
	global.__text_data.delay = {};
}

function text_add_char_delay(char_string, delay_multiplier) {
	for (var i=0; i<string_length(char_string); i++) {
		global.__text_data.delay[$ string_char_at(char_string, i)] = delay_multiplier;
	}
}

function text_set_gain(gain) {
	global.__text_data.gain = gain;
}
#endregion