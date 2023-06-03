width = 100;
height = 100;
pages = [""];
pageIndex = -1;

color = c_white;
font = global.fontLarge;
sound = undefined;
character = undefined;
charFace = noone;
charTalk = noone;

checkInputs = false;
endFunc = undefined;

state = "text";
/* possible states
	text
	choice
*/

textObj = text_create();

#region functions
next_page = function() {
	while ((++ pageIndex) < array_length(pages)) {
		var text = pages[pageIndex];
		var command = get_command(text);
		var param = get_param(text, command);
		
		switch command {
		default:
			var func = global.dialog_data.func[$ command];
			if (!is_undefined(func)) {
				func(id, param);
				break;
			}
			
			textObj.set_text(text);
			return true;
		case "color":
			color = global.colorStruct[$ param];
			if is_undefined(color) {
				color = c_white;
			}
			break;
		case "font":
			font = global.fontStruct[$ param];
			if is_undefined(font) {
				font = global.fontLarge;
				show_message("Font \""+param+"\" does not exist.");
			}
			break;
		case "sound":
			textObj.set_sound(global.soundStruct[$ param]);
			break;
		case "speed":
			textObj.set_speed(real(param));
			break;
		case "sprite":
			var spr = asset_get_index(param);
			if (spr = -1) spr = noone;
			sprite_index = spr;
			break;
		case "character":
		case "char":
			character = global.dialog_data.char[$ param];
			if is_undefined(character) {
				textObj.set_sound(sound);
				sprite_index = noone;
			} else {
				textObj.set_sound(character.sound);
				charFace = character.defaultFace;
				charTalk = character.defaultTalk;
			}
			break;
		case "face":
			if is_undefined(character) break;
			charFace = character.face[$ param] ?? character.defaultFace;
			charTalk = character.face[$ param + "_talk"] ?? charFace;
			break;
		case "choice":
			textObj.set_text(param);
			state = "choice";
			optionSelected = 0;
			optionKey = [];
			optionText = [];
			break;
		case "option":
			if (string_char_at(param, 1) = "[") {
				var endPos = string_pos_ext("]", param, 3);
				var key = string_copy(param, 2, endPos - 2);
				param = string_trim_start(string_delete(param, 1, endPos), [" ", "\t"]);
			} else {
				var key = undefined;
			}
			
			array_push(optionKey, key);
			array_push(optionText, param);
			
			if ((pageIndex + 1) >= array_length(pages)) return true;
			if (get_command(pages[pageIndex + 1]) != "option") return true;
			break;
		}
	}
	
	return false;
}

set_text = function(str_or_array) {
	if is_string(str_or_array) str_or_array = [str_or_array];
	pages = str_or_array;
	pageIndex = -1;
	next_page();
}

set_size = function(w, h) {
	width = w;
	height = h;
}

check_inputs = function(check = true) {
	checkInputs = check;
}

set_end_method = function(_method) {
	endFunc = _method;
}

close = function() {
	if is_method(endFunc) {
		endFunc();
	}
	instance_destroy();
}

get_command = function(str) {
	if (string_char_at(str, 1) != "#") return "";
	var first = string_char_at(str, 2);
	if (first = " " || first = "\t") return "";
	var param = string_split_ext(str, [" ", "\t"], false, 1); //spaces and tabs
	return string_delete(param[0], 1, 1); //remove #
}

get_param = function(str, command) {
	return string_trim_start(string_delete(str, 1, string_length(command) + 2), [" ", "\t"]);
}
#endregion