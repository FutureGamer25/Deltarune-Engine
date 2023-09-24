pos = 0;
index = 0;
charSprite = char_sprite_create(global.charMapDarkSusie);

init = function(follower_index) {
	index = follower_index;
	pos = follower_get_pos(index);
	
	var data = follower_get_data(pos);
	
	x = data.x;
	y = data.y;
	char_sprite_dir(charSprite, data.dirX, data.dirY);
	char_sprite_state(charSprite, "stand");
}