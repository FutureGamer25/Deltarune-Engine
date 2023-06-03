function room_fade(numb, color = c_black) {
	with obj_room_fade {
		if fadeIn return -1;
	}
	
	var inst = instance_create_depth(0, 0, 0, obj_room_fade);
	inst.color = color;
	inst.newRoom = numb;
	return inst;
}