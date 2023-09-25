draw_set_gui_2x();

var w = display_get_gui_width();
var h = display_get_gui_height();
var top = h - 154;
draw_set_color(c_black);
draw_rectangle(0, top, w, h, false);
draw_set_color(#332033);
draw_rectangle(0, top, w, top + 2, false);
draw_rectangle(0, top + 36, w, top + 38, false);

draw_reset_gui_2x();