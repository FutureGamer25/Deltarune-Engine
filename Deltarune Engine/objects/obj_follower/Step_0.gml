if follow {
var newPos = follower_get_pos(index);

	if (newPos > pos) {
		pos = newPos
		var data = follower_get_data(pos);
	
		x = data.x;
		y = data.y;
		image_speed = 1 + data.run;
		char_sprite_dir(charSprite, data.dirX, data.dirY);
		char_sprite_state(charSprite, data.state);
	} else {
		image_index = 0;
		image_speed = 0;
		char_sprite_state_delay_frame(charSprite, "stand");
	}
}
	char_sprite_update(charSprite);
