function lang_file_unload(name) {
	var key_arr = ds_map_find_value(global.lang_files, name);
	if is_undefined(key_arr) return; // file isn't loaded
	var keys = array_length(key_arr);
	
	for (var i=0; i<keys; i++) {
	    ds_map_delete(global.lang_text, key_arr[i]);
	}
	
	ds_map_delete(global.lang_files, name);
}