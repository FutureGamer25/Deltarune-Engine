/// @desc draw sprite
if draw != undefined draw(draw_state,x,y,1);
else draw_self();

if light{
	var sinned = (sin(current_time/200)+1)/2
	
	gpu_set_fog(true, c_white, 0, 1000);
	
	if draw != undefined draw(draw_state,x,y,sinned);
	else draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,sinned);
	
	gpu_set_fog(false, c_white, 0, 1000);
}
