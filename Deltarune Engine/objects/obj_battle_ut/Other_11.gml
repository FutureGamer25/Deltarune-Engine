/// @desc BG
bg_spr		= spr_generic_bg
bg_frame	= 0;
bg_x		= 15;
bg_y		= 9;

bg_draw = function(){
	if bg_spr != -1 draw_sprite(bg_spr,bg_frame,bg_x,bg_y);
}










