draw_set_gui_2x();
draw_sprite_stretched_ext(sprite_index,0,x-5,y,120,38,member.colour,1);
image_blend=member.colour;
draw_self();
draw_reset_gui_2x();