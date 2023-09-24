pause = false;

walkSpeed = 60 * global.dt;
runSpeed = 120 * global.dt;
running = false;
interactDist = 4;
interactList = ds_list_create();

charSprite = char_sprite_create(global.charMapDarkKris);

//test anime system
//var anim = do_anime(x, x + 100, 60, "elastic", function(a) { x = a; });
//create_anime(x).add(x+100, 60, "elastic").add(x, 60, "bounce").start(function(a) { x = a; });

follower_add(obj_susie);
follower_add(obj_ralsei);

set_pause = function(_pause) {
	pause = _pause;
	running = false;
	char_sprite_state_delay_frame(charSprite, "stand");
}

can_menu = true;