if (!changeRoom) exit;

var exits = {
	A : obj_exit_A,
	B : obj_exit_B,
	C : obj_exit_C,
	D : obj_exit_D
}

if instance_exists(obj_player) {
	char_sprite_dir(obj_player.charSprite, playerDirX, playerDirY);
	var obj = exits[$ string_upper(exit_letter)];
	if instance_exists(obj) {
		obj_player.x = obj.x + (obj.sprite_width / 2);
		obj_player.y = obj.y + (obj.sprite_height / 2);
	}
	follower_reset();
}

instance_unpause_all();
instance_destroy();