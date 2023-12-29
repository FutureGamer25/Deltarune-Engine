draw_set_gui_2x();

var w = display_get_gui_width();
var h = display_get_gui_height();

draw_reset_gui_2x();

draw_set_color(c_white);
draw_set_font(font_dt_sans);
draw_text_transformed(x,y+4,member.name,1,1,0);

draw_text_transformed(x+46,y+10,"HP",0.5,0.5,0);
draw_sprite_ext(spr_pixel,0,x+56,y+10,40,8,0,c_red,1);
draw_sprite_ext(spr_pixel,0,x+56,y+10,(member.hp/member.maxHp)*40,8,0,member.colour,1);
draw_set_color(c_white);
draw_set_font(font_dt_sans);
draw_text_transformed(x+56,y+2,string(member.hp)+" / "+string(member.maxHp),0.5,0.5,0);