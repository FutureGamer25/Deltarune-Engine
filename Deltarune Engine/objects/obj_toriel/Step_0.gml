/// @desc
if spr_override exit;
move_and_collide(moveX,moveY,obj_wall);

//var moving = moveX && moveY = 0 ? false : true;

//if moving {
//	image_speed = 1;
//	char_sprite_state(charSprite, "walk");
//} else {
//	image_index = 0;
//	image_speed = 0;
//	char_sprite_state_delay_frame(charSprite, "stand");
//}

//char_sprite_dir(charSprite, moveX, moveY);

var xx = char_sprite_get_x(charSprite)
if xx = 1 || xx =  -1 { //hori
	if xx = -1 image_xscale = -1;
	else image_xscale = 1;
}


char_sprite_update(charSprite);









