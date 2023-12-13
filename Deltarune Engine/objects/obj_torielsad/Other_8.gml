/// @desc
do_anime(1, 0, 10, "linear", function(a) { image_alpha = a; });
with(obj_frick) do_anime(1, 0, 10, "linear", function(a) { image_alpha = a; });
		call_later(10,time_source_units_frames,function(){
			instance_destroy();
			follower_set_delay(10);
			room_fade(rm_theaterINT);
		})













