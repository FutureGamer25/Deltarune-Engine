/// @desc
//TODO: customize
draw_set_font(font_dt_mono);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_balloon,0,x-text_w/2,y-text_w/2,text_w,text_h);
draw_sprite(spr_tail,0,x-text_w/2,y);

draw_set_color(c_black);

draw_text(x,y,text);

draw_set_color(c_white);
