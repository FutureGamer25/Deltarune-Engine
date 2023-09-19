function lang_file_load(name) {
	if (ds_map_exists(global.lang_files, name)) return;
	
	var key_arr = [];
	var key = undefined;
	var pages;
	ds_map_add(global.lang_files, name, key_arr);
	
	var dir = global.lang_directory + name;
	
	if (!file_exists(dir)) {
		show_message("Language file \""+name+"\" does not exist in directory \""
			+global.lang_directory_name+"\".");
		return;
	}
	
	var file = file_text_open_read(dir);
	
	while (!file_text_eof(file)) {
	    var line = file_text_read_string(file);
		file_text_readln(file);
		line = string_trim_start(line);
		var char = string_char_at(line, 1);
		
		if (char = "[") { //get key
			var endPos = string_pos_ext("]", line, 3);
			key = string_copy(line, 2, endPos - 2);
			pages = [];
			array_push(key_arr, key);
			ds_map_set(global.lang_text, key, pages);
			
			line = string_trim_start(string_delete(line, 1, endPos));
			char = string_char_at(line, 1);
		}
		
		if (is_undefined(key)) continue;
		
		if (char = "\"") { //quoted text
			var endPos = string_last_pos("\"", line);
			if (endPos = 0) endPos = string_length(line);
			line = string_copy(line, 2, endPos - 2);
		} else {
			var comment = string_pos("//", line);
			if (comment != 0) {
				line = string_copy(line, 1, comment - 1);
			}
			
			line = string_trim_end(line);
			if (line = "") continue;
		}
		
		line = string_replace_all(line, global.lang_newline_str, "\n");
		array_push(pages, line);
	}
	
	file_text_close(file);
}