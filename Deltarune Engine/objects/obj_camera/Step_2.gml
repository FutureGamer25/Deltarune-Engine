switch mode {
case "player":
	if instance_exists(obj_player) {
		x = ceil(obj_player.x - 0.5);
		y = ceil(obj_player.y - 0.5);
	}
	camera_pos_object(camera, id, true);
	break;
case "center":
	x = room_width / 2;
	y = room_height / 2;
	camera_pos_object(camera, id, false);
	break;
case "char":
	if instance_exists(obj){
		x = ceil(obj.x - 0.5);
		y = ceil(obj.y - 0.5);
	}
	camera_pos_object(camera, id, true);
	break;
}