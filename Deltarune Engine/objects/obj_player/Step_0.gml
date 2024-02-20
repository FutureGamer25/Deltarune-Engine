if get_pause() {
	running = false;
	image_index = 0;
	image_speed = 0;
	char_sprite_state_delay(charSprite, "stand");
} else {


var horizontal = input_check("right") - input_check("left");
var vertical = input_check("down") - input_check("up");
var menu = input_check_pressed("menu");
var run = input_check("cancel");
var interact = input_check_pressed("confirm");

#region move
running = run;
var moveSpeed = running ? runSpeed : walkSpeed;
image_speed = 1 + running;

var moveX = horizontal * moveSpeed
var moveY = vertical * moveSpeed;

if (moveX != 0) {
	x += moveX;
	if place_meeting(x, y, obj_wall) {
		x = floor(x);
		while (place_meeting(x, y, obj_wall)) {
			x -= sign(moveX);
		}
		moveX = 0;
	}
}

if (moveY != 0) {
	y += moveY;
	if place_meeting(x, y, obj_wall) {
		y = floor(y);
		while (place_meeting(x, y, obj_wall)) {
			y -= sign(moveY);
		}
		moveY = 0;
	}
}

var moving = (moveX != 0 || moveY != 0);
#endregion

#region sprites
if moving {
	image_speed = 1;
	char_sprite_state(charSprite, "walk");
} else {
	image_index = 0;
	image_speed = 0;
	char_sprite_state_delay(charSprite, "stand");
}

char_sprite_dir(charSprite, horizontal, vertical);
#endregion

#region interact
if interact {
	var faceX = char_sprite_get_x(charSprite);
	var faceY = char_sprite_get_y(charSprite);
	var xx = x + faceX * interactDist;
	var yy = y + faceY * interactDist;
	ds_list_clear(interactList);
	instance_place_list(xx, yy, all, interactList, false);
	
	for (var i=0; i<ds_list_size(interactList); i++) {
		var inst = interactList[|i];
		if asset_has_tags(inst.object_index, "interact", asset_object) {
			with inst event_user(0);
			break;
		}
	}
}else if menu {
	if !instance_exists(obj_menu_light) && can_menu{
		instance_create_depth(0,0,0,obj_menu_light);
		can_menu = false;
	}
}
#endregion

if moving follower_add_data();


} //end pause


char_sprite_update(charSprite);