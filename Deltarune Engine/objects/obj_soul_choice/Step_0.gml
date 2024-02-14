if (x_val&&y_val){
	if (input_check("left")){
		if (slot_x=0){
			selected_val=table_width-1;
			x+=change_x*(table_width-1);
			slot_x=table_width-1;
			show_message("selected_val: "+string(selected_val));
		} else {
			selected_val--;
			x-=change_x;
			slot_x--;
			show_message("selected_val: "+string(selected_val));
		}
	}
		if (input_check("right")){
		if (selected_val=val_max){
			selected_val=0;
			x-=change_x*val_max;
			slot_x=0;
			show_message("selected_val: "+string(selected_val));
		} else {
			selected_val++;
			x+=change_x;
			slot_x++;
			show_message("selected_val: "+string(selected_val));
		}
	}
}


	if (input_check("up")){
		if (selected_val<table_width){
			selected_val=(val_max-(table_width-selected_val))+1;
			y+=((change_y*val_max)-change_y)/table_width;
			show_message("selected_val: "+string(selected_val));
		} else {
			selected_val-=table_width;
			y-=change_y;
			show_message("selected_val: "+string(selected_val));
		}
	}
		if (input_check("down")){
		if (selected_val>(val_max-table_width)){
			selected_val=0+slot_x;
			y-=((change_y*val_max)-change_y)/table_width;
			show_message("selected_val: "+string(selected_val));
		} else {
			selected_val+=table_width;
			y+=change_y;
			show_message("selected_val: "+string(selected_val));
		}
	}
