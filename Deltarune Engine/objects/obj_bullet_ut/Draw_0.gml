/// @desc
surface_set_target(obj_battle_ut.surf);
///in surface woah!
var col = c_black;
draw_rectangle_color(l,t,w,h,col,col,col,col,false);
draw_self();
surface_reset_target();
//no long in surface. un-woah!
draw_surface(obj_battle_ut.surf, 0, 0);