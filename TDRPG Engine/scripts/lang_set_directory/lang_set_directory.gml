function lang_set_directory(name = "") {
	var dir = working_directory + name;
	if (name != "") && (string_char_at(name, string_length(name)) != "\\") {
		dir += "\\";
	}
	
	if (!directory_exists(dir)) {
		show_message("Language directory \""+name+"\" does not exist.");
		return;
	}
	
	global.lang_directory = dir;
	global.lang_directory_name = name;
	var keys = ds_map_keys_to_array(global.lang_files);
	
	for (var i=0; i<array_length(keys); i++) {
		lang_file_force_load(keys[i]);
	}
}

// init stuff

global.lang_directory = working_directory;
global.lang_directory_name = "";
global.lang_newline_str = "#";
global.lang_text = ds_map_create();
global.lang_files = ds_map_create();