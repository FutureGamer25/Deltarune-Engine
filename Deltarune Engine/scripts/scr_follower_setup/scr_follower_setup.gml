global.follower_delay = 0.4; //in seconds
global.follower_player = obj_player; //the object to follow

function __follower_data_obj(obj) constructor {
	x = obj.x;
	y = obj.y;
	dirX = char_sprite_get_x(obj.charSprite);
	dirY = char_sprite_get_y(obj.charSprite);
	state = char_sprite_get_state(obj.charSprite);
	run = obj.running;
}

function __follower_data_pos(_x, _y, move_x, move_y) constructor {
	x = _x;
	y = _y;
	dirX = move_x;
	dirY = move_y;
	state = "walk";
	run = max(abs(move_x), abs(move_y)) >= obj_player.runSpeed;
}