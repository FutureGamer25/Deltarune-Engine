/// @desc
text_name	= "Kris";
text_lv		= "lv"
text_hp		= "hp"
text_dollar	= "$"

value_lv	= "1"
value_hp	= "20/20 "
value_dollar= "2"

cell_lock	= true;

menu_list	= [
	"ITEM",
	"STAT",
	"CELL"
]
menu_total	= array_length(menu_list);
menu_select = 0;

can_input	= false;
alarm[0]	= 1;



destroy = function(){
	obj_player.can_menu = true;
	alarm[1]=1;
}