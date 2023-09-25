/// @desc
var menu		= input_check_pressed("cancel");
var vertical	= input_check("vertical_pressed");
var horizontal	= input_check("horizontal_pressed");
var confirm		= input_check_pressed("confirm")


if can_input {
	switch(menu_level){
		case 0: //main menu options: ITEM - STAT - CELL
			if menu {
				destroy();
			}else if confirm {
				switch(menu_select){
					case 0:
						if !item_lock update_menu_level(1);
						break;
					case 1:
						update_menu_level(1);
						break;
					case 2:
						if !cell_lock update_menu_level(1);
						break;
				}
			}else {
				menu_select = clamp(menu_select+vertical,0,menu_total-1);
			}
			break;
		case 1:	// Depends on level 0 option is selected
			if menu && item_choice_selection = -1{
				update_menu_level(0);
			}else if confirm{
				switch(menu_select){
					case 0: //item
						if confirm {
							item_choice_selection = 0;
						}else if item_choice_selection = -1{
							item_select = clamp(item_select+vertical,0,item_total-1);
						}
						break;
					case 1: //stat
						
						break;
					case 2: //cell
						
						break;
				}
			}else{ //NOT hitting cancel or confirm
				if menu_select = 0 && item_choice_selection != -1 {
					item_choice_selection = clamp(item_choice_selection+horizontal,0,item_choice_total-1);
					if menu {
						item_choice_selection = -1;
					}else if confirm{
						update_menu_level(0);
						switch(item_choice_selection){
							case 0: //use
							
								//note: after text is done, close ow_menu_light
								break;
							case 1: //info
							
								//note: after text is done, close ow_menu_light
								break;
							case 2: //drop
							
								//note: after text is done, close ow_menu_light
								break;
						}
					}
				}
			}		
			break;
	}
}
