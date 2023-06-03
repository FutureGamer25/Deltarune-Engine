#region cutscene testing

//init cutscene
scene = cutscene_create();

//define cutscene
scene_func(function() {
	asd = instance_create_depth(0, 0, 0, obj_ice_cream_man);
});

scene_label("label");

scene_thread_start();
	scene_lerp_func(1, 2, 40, "", function(scale) {
		asd.image_xscale = scale;
	});
	scene_lerp_func(2, 1, 100, "", function(scale) {
		asd.image_xscale = scale;
	});
scene_thread_add();
	scene_lerp_func(360, 0, 100, "", function(angle) {
		asd.image_angle = angle;
	});
scene_thread_end();
scene_move_speed("v:asd", 60, 0, 2);
scene_wait(10);

scene_move_time("v:asd", 30, 30, 60);
scene_lerp_func(0, 360, 200, "cubic", function(angle) {
	asd.image_angle = angle;
});
scene_move_time("v:asd", 60, 60, 60);
scene_wait(60);
scene_move_speed("v:asd", 0, 60, 2);
scene_wait(10);
scene_move_speed("v:asd", 0, 0, 2);
scene_wait(10);

scene_goto("label");

//start cutscene
cutscene_run();

#endregion