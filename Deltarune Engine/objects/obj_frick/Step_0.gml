/// @desc

event_inherited();

var xx = char_sprite_get_x(charSprite)
if xx = 1 || xx =  -1 { //hori
	if xx = -1 image_xscale = -1;
	else image_xscale = 1;
}