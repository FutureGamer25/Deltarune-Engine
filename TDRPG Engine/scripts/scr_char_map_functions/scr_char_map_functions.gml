function char_map_create() {
	return {
		defaultState : "",
		state : {}
	};
}

function char_map_default(char_map, default_state) {
	char_map.defaultState = default_state;
}

function char_map_1dir(char_map, state_name, sprite) {
	char_map.state[$ state_name] = [sprite];
}

function char_map_4dir(char_map, state_name, up, down, left, right) {
	char_map.state[$ state_name] = [right, down, left, up];
}

function char_map_8dir(char_map, state_name, right, up_right, up, up_left, left, down_left, down, down_right) {
	char_map.state[$ state_name] = [right, down_right, down, down_left, left, up_left, up, up_right];
}

function char_sprite_create(char_map, inst_id = id) {
	var defState = char_map.defaultState;
	return {
		parent : inst_id,
		angle : 90,
		dirX : 0,
		dirY : 1,
		state : defState,
		targetState : defState,
		prevState : defState,
		delayFrame : 0,
		stateStruct : char_map.state
	};
}

function char_sprite_dir(char_sprite, dir_x, dir_y) {
	if (dir_x = 0 && dir_y = 0) return;
	char_sprite.dirX = dir_x;
	char_sprite.dirY = dir_y;
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
	
	#region update state
	if (char.state != char.targetState) {
		if (char.delayFrame != floor(par.image_index)) {
			char.state = char.targetState;
		}
	}
	
	if (char.state != char.prevState) {
		char.prevState = char.state;
		par.image_index = 0;
	}
	#endregion
	
	#region update angle and sprite
	var state = char.stateStruct[$ char.state];
	if (!is_array(state)) {
		par.sprite_index = -1;
		return;
	}
	
	var num = array_length(state);
	if (num = 1) {
		char.angle = 0;
		par.sprite_index = state[0];
		return;
	}
	
	var angle = arctan2(char.dirY, char.dirX) * num / (2 * pi) + num;
	var index = round(angle) % num;
	if ((index * 360 != char.angle * num) && abs(frac(angle) * 2 - 1) <= 0.2) {
		var midAng = (floor(angle) + 0.5) * 360 / num + 360;
		index = ((midAng - char.angle) % 360 < 180 ? floor(angle) : ceil(angle)) % num;
	}
	char.angle = index * 360 / num;
	par.sprite_index = state[index];
	#endregion
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
	return dcos(char_sprite.angle);
}

function char_sprite_get_y(char_sprite) {
	return dsin(char_sprite.angle);
}