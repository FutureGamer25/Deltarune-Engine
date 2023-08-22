function char_map_create() {
	return {
		defaultState : "",
		state : {}
	};
}

function char_map_default(char_map, default_state) {
	char_map.defaultState = default_state;
}

function char_map_4dir(char_map, state_name, up, down, left, right) {
	char_map.state[$ state_name] = [right, down, left, up];
}

function char_map_1dir(char_map, state_name, sprite) {
	char_map.state[$ state_name] = sprite;
}

function char_sprite_create(char_map, inst_id = id) {
	var defState = char_map.defaultState;
	return {
		parent : inst_id,
		faceX : 0,
		faceY : 1,
		state : defState,
		prevState : defState,
		targetState : defState,
		delayFrame : 0,
		stateStruct : char_map.state
	};
}

function char_sprite_dir(char_sprite, dir_x, dir_y) {
	//currently only supports 4dir
	var scl = max(abs(dir_x), abs(dir_y));
	if (scl = 0) return;
	scl = 1 / (1.5 * scl);
	dir_x = round(dir_x * scl);
	dir_y = round(dir_y * scl);
	
	if (dir_x != 0 && dir_y != 0) {
		if (dir_x = char_sprite.faceX || dir_y = char_sprite.faceY) return;
		dir_x = 0;
	}
	
	char_sprite.faceX = dir_x;
	char_sprite.faceY = dir_y;
}

function char_sprite_state(char_sprite, state_name) {
	char_sprite.state = state_name;
	char_sprite.targetState = state_name;
}

function char_sprite_state_delay(char_sprite, state_name) {
	//change state after the current frame finishes
	if (char_sprite.targetState = state_name) return;
	char_sprite.targetState = state_name;
	char_sprite.delayFrame = floor(char_sprite.parent.image_index);
}

function char_sprite_update(char_sprite) {
	var char = char_sprite;
	var par = char.parent;
	if (char.state != char.targetState) {
		if (char.delayFrame != floor(par.image_index)) {
			char.state = char.targetState;
		}
	}
	
	if (char.state != char.prevState) {
		char.prevState = char.state;
		par.image_index = 0;
	}
	
	var state = char.stateStruct[$ char.state];
	if is_array(state) {
		//TODO: don't use modulo
		var angle = modulo(darctan2(char.faceY, char.faceX), 360);
		par.sprite_index = state[round(angle / 90)];
	} else if is_real(state) {
		par.sprite_index = state;
	} else {
		par.sprite_index = -1;
		return;
	}
}

function char_sprite_set_map(char_sprite, char_map) {
	var defState = char_map.defaultState;
	char_sprite.stateStruct = char_map.state;
	char_sprite.state = defState;
	char_sprite.prevState = defState;
	char_sprite.targetState = defState;
}

function char_sprite_get_state(char_sprite) {
	return char_sprite.state;
}

function char_sprite_get_x(char_sprite) {
	return char_sprite.faceX;
}

function char_sprite_get_y(char_sprite) {
	return char_sprite.faceY;
}