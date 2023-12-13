var x_x = x-xxx;
var y_y = y-yyy;
xxx = x;
yyy = y;
char_sprite_dir(charSprite, x_x, y_y);

if x_x != 0 || y_y != 0 char_sprite_state(charSprite,"walk");
else {
	char_sprite_state_delay(charSprite,"stand");
}

var xx = char_sprite_get_x(charSprite)
if xx = 1 || xx =  -1 { //hori
	if xx = -1 image_xscale = -1;
	else image_xscale = 1;
}



if spr_update char_sprite_update(charSprite);