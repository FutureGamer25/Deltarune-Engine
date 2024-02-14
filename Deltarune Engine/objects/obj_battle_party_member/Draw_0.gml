draw_set_gui_2x();

var w = display_get_gui_width();
var h = display_get_gui_height();
var hp_col=c_white;

if (member.hp<(member.maxHp/5) && member.hp>0){hp_col=c_yellow}
else if (member.hp<1){hp_col=c_red}
else{hp_col=c_white}
draw_reset_gui_2x();

draw_set_color(c_white);
draw_set_font(global.font_party_name_long);
draw_text_transformed(x,y+4,member.name,0.75,0.75,0);

draw_text_transformed(x+46,y+11,"HP",0.4,0.4,0);
draw_set_color(hp_col);
draw_text_transformed(x+56,y+2,string(member.hp)+" / "+string(member.maxHp),0.5,0.5,0);
draw_sprite_ext(spr_pixel,0,x+56,y+12,40,6,0,c_red,1);
draw_sprite_ext(spr_pixel,0,x+56,y+12,(member.hp/member.maxHp)*40,6,0,member.colour,1);