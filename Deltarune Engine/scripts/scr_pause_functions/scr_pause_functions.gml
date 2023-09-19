function instance_pause(_id, pause = true) {
	static func = function(ts, _id, pause) {
		time_source_destroy(ts);
		
		if (_id = all) {
			var assets = tag_get_asset_ids("pause", asset_object);
			var len = array_length(assets);
			for (var i=0; i<len; i++) {
				with (assets[i]) {
					set_pause(pause);
				}
			}
		} else {
			//feather disable once all
			if (!instance_exists(_id)) return;
			if (!asset_has_tags(_id.object_index, "pause", asset_object)) return;
			_id.set_pause(pause);
		}
	}
	
	var ts = time_source_create(time_source_game, 1, time_source_units_frames, func);
	time_source_reconfigure(ts, 1, time_source_units_frames, func, [ts, _id, pause], 1, time_source_expire_after);
	time_source_start(ts);
}

function instance_unpause(_id) {
	instance_pause(_id, false);
}

function instance_pause_all(pause = true) {
	instance_pause(all, pause);
}

function instance_unpause_all() {
	instance_pause_all(false);
}