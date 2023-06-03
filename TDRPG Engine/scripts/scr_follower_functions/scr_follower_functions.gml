function follower_init() {
	follower_remove_all();
	instance_create_depth(0, 0, 0, obj_follower_controller);
}

function follower_reset() { //set to player position
	with obj_follower_controller {
		data = [];
		data[0] = new __follower_data_obj(global.follower_player);
		
		for (var i=0; i<folCount; i++) {
			follower[i].init(i);
		}
	}
}

function follower_add(obj = obj_follower) {
	with obj_follower_controller {
		var fol = instance_create_layer(obj_player.x, obj_player.y, obj_player.layer, obj);
		follower[folCount] = fol;
		fol.init(folCount);
		folCount ++;
		return fol;
	}
}

function follower_remove(obj) {
	with obj_follower_controller {
		var index = array_find_index(follower, function(elem, ind) {
			if elem = obj return true;
			return (elem.object_index = obj);
		});
		
		if (index = -1) return false;
		return follower_remove_index(index);
	}
}

function follower_remove_index(index) {
	with obj_follower_controller {
		if (index >= array_length(follower)) return false;
		
		instance_destroy(follower[index]);
		array_delete(follower, index, 1);
		folCount --;
		
		var maxSize = folCount * folSpacing + 1;
		if (array_length(data) > maxSize) {
			array_resize(data, maxSize);
		}
		
		for (var i=index; i<folCount; i++) {
			follower[i].init(i);
		}
		
		return true;
	}
}

function follower_remove_all() {
	with obj_follower_controller {
		for (var i=0; i<folCount; i++) {
			instance_destroy(follower[i]);
		}
		instance_destroy();
	}
}

function follower_add_data() {
	with obj_follower_controller {
		playerPos ++;
		array_insert(data, 0, new __follower_data_obj(global.follower_player));
		var maxSize = folCount * folSpacing + 1;
		if (array_length(data) > maxSize) {
			array_resize(data, maxSize);
		}
	}
}

function follower_path() { //create snake at current follower positions
	with obj_follower_controller {
		var pos1 = 0;
		var x1 = obj_player.x;
		var y1 = obj_player.y;
		
		for (var i=0; i<folCount; i++) {
			var fol = follower[i];
			var pos2 = (i + 1) * folSpacing;
			var x2 = fol.x;
			var y2 = fol.y;
			var move_x = (x1 - x2) / folSpacing;
			var move_y = (y1 - y2) / folSpacing;
			
			for (var j=pos1; j<pos2; j++) {
				var n = (j - pos1) / folSpacing;
				var _x = lerp(x1, x2, n);
				var _y = lerp(y1, y2, n);
				data[j] = new __follower_data_pos(_x, _y, move_x, move_y);
			}
			
			pos1 = pos2;
			x1 = x2;
			y1 = y2;
		}
		
		data[j + 1] = new __follower_data_pos(_x, _y, move_x, move_y);
	}
}



//called by followers

function follower_get_pos(follower_index) {
	with obj_follower_controller {
		return playerPos - min(array_length(data) - 1, (follower_index + 1) * folSpacing);
	}
}

function follower_get_data(pos) {
	with obj_follower_controller {
		return data[clamp(playerPos - pos, 0, array_length(data) - 1)];
	}
}