function lang_get(key) {
	var text = ds_map_find_value(global.lang_text, key);
	
	if is_undefined(text) return "Key not found with name \"" + key + "\".";
	if (array_length(text) <= 0) return "No text in key \"" + key + "\".";
	
	return text[0];
}