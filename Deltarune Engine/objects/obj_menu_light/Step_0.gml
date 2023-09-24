/// @desc
var menu = get_input_pressed("cancel");
var vertical = get_input("vertical_pressed");

if can_input {
	menu_select = clamp(menu_select+vertical,0,menu_total-1);
	if menu{
		destroy();
	}
}