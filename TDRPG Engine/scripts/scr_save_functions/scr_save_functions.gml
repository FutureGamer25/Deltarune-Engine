#region save / load game
function save_game() {
	save_key("room", room_get_name(room));
	if instance_exists(obj_player) {
		save_key("player_x", obj_player.x);
		save_key("player_y", obj_player.y);
	}
	
	save_all_data(); //save keys to disk
}

function load_game() {
	load_all_data(); //load keys from disk
	
	var rm = load_key("room", room_get_name(room));
	room_goto(asset_get_index(rm));
	instance_create_depth(0, 0, 0, obj_load_game_room_start);
}
#endregion

#region key functions
function save_key(key, value) {
	global.saveData.data.general[$ key] = value;
}

function load_key(key, _default) {
	return global.saveData.data.general[$ key] ?? _default;
}

function save_key_room(key, value) {
	var roomName = room_get_name(room);
	var rm = global.saveData.data.rooms[$ roomName];
	if is_undefined(rm) {
		rm = {};
		global.saveData.data.rooms[$ roomName] = rm;
	}
	rm[$ key] = value;
}

function load_key_room(key, _default) {
	var roomName = room_get_name(room);
	var rm = global.saveData.data.rooms[$ roomName];
	if is_undefined(rm) return _default;
	return rm[$ key] ?? _default;
}

function save_key_static(key, value) {
	global.saveData.staticData[$ key] = value;
	save_json(global.saveFileStatic, global.saveData.staticData);
}

function load_key_static(key, _default) {
	return global.saveData.staticData[$ key] ?? _default;
}

function save_key_global(key, value) {
	global.saveDataGlobal[$ key] = value;
	save_json(global.saveFileGlobal, global.saveDataGlobal);
}

function load_key_global(key, _default) {
	return global.saveDataGlobal[$ key] ?? _default;
}
#endregion

#region misc functions
function save_set_slot(slot_index) {
	global.saveSlot = slot_index;
	var str = string(slot_index);
	global.saveFile = "save_" + str;
	global.saveFileStatic = "save_static_" + str;
}

function save_get_slot() {
	return global.saveSlot;
}

function save_slot_exists(slot) {
	var oldSlot = save_get_slot();
	save_set_slot(slot);
	var exists = (file_exists(global.saveFile) || file_exists(global.saveFileStatic));
	save_set_slot(oldSlot);
	return exists;
}

function load_slot_temp_start(slot) {
	global.saveDataOld = global.saveData;
	global.saveSlotOld = save_get_slot();
	save_set_slot(slot);
	load_all_data();
}

function load_slot_temp_end() {
	save_set_slot(global.saveSlotOld);
	global.saveData = global.saveDataOld;
}

function save_reset_keys() {
	global.saveData = {
		data : {
			general : {},
			rooms : {}
		},
		staticData : {}
	};
}
#endregion

#region game data
function save_all_data() {
	save_json(global.saveFile, global.saveData.data);
	
	if (struct_names_count(global.saveData.staticData) > 0) {
		save_json(global.saveFileStatic, global.saveData.staticData);
	}
}

function load_all_data() {
	save_reset_keys();
	var data = load_json(global.saveFile);
	if (!is_undefined(data)) global.saveData.data = data;
	
	global.saveData.staticData = load_json(global.saveFileStatic) ?? {};
}
#endregion

#region json
function save_json(file_name, struct_or_array) {
	var json = json_stringify(struct_or_array);
	var file = file_text_open_write(file_name);
	file_text_write_string(file, json);
	file_text_close(file);
}

function load_json(file_name) {
	if (!file_exists(file_name)) return undefined;
	var file = file_text_open_read(file_name);
	var json = file_text_read_string(file);
	file_text_close(file);
	if (json = "") return undefined;
	return json_parse(json);
}
#endregion

#region init
global.saveFileGlobal = "save_global";
global.saveDataGlobal = load_json(global.saveFileGlobal) ?? {};
save_set_slot(0);
save_reset_keys();
#endregion