camera = -1;
mode = "player";

camera_pos_clamp = function() {
	var w = camera_get_view_width(camera);
	var h = camera_get_view_height(camera);
	var xx = clamp(x - w / 2, 0, room_width - w);
	var yy = clamp(y - h / 2, 0, room_height - h);
	camera_set_view_pos(camera, xx, yy);
}

camera_pos = function() {
	var w = camera_get_view_width(camera);
	var h = camera_get_view_height(camera);
	camera_set_view_pos(camera, x - w / 2, y - h / 2);
}