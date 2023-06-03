global.layerSortDepth = -1;

function layer_instances_sort_depth(layer_id) {
	static drawLayer = -1;
	
	static drawFunc = function() {
		static priority = ds_priority_create();
		if event_type != ev_draw return;
		if event_number != ev_draw_normal return;
		if (!layer_exists(global.layerSortDepth)) return;
		
		#region get instances
		ds_priority_clear(priority);
		var elements = layer_get_all_elements(global.layerSortDepth);
		
		for (var i=0; i<array_length(elements); i++) {
			var elem = elements[i];
			if (layer_get_element_type(elem) != layerelementtype_instance) continue;
			
			var inst = layer_instance_get_instance(elem);
			if (!inst.visible) continue;
			
			ds_priority_add(priority, inst, inst.y);
		}
		#endregion
		
		while (!ds_priority_empty(priority)) {
			var inst = ds_priority_delete_min(priority);
			with inst {
				event_perform(ev_draw, ev_draw_normal);
			}
		}
	}
	
	if is_string(layer_id) layer_id = layer_get_id(layer_id);
	if (!layer_exists(layer_id)) return;
	
	global.layerSortDepth = layer_id;
	if layer_get_visible(layer_id) layer_set_visible(layer_id, false);
	
	var _depth = layer_get_depth(layer_id);
	
	if layer_exists(drawLayer) {
		if (layer_get_depth(drawLayer) != _depth) {
			layer_depth(drawLayer, _depth);
		}
	} else {
		drawLayer = layer_create(_depth);
		layer_script_end(drawLayer, method_get_index(drawFunc));
	}
}

/*function layer_instances_sort_depth(layer_id, camera = view_get_camera(0)) {
	static instances = [];
	
	if is_string(layer_id) layer_id = layer_get_id(layer_id);
	if (!layer_exists(layer_id)) return;
	
	#region get instances
	var elements = layer_get_all_elements(layer_id);
	
	for (var i=0; i<array_length(elements); i++) {
		var elem = elements[i];
		if (layer_get_element_type(elem) != layerelementtype_instance) continue;
		
		var inst = layer_instance_get_instance(elem);
		if (!array_contains(instances, inst)) {
			array_push(instances, inst);
		}
	}
	#endregion
	
	#region set depth
	var offset = -8000;
	
	if (camera = -1) {
		offset += room_height / 2;
	} else {
		offset += camera_get_view_y(camera) + (camera_get_view_height(camera) / 2);
	}
	
	for (var i=0; i<array_length(instances); i++) {
		var inst = instances[i];
		if instance_exists(inst) {
			with (inst) depth = offset - y;
		} else {
			array_delete(instances, i, 1);
			i --;
		}
	}
	#endregion
}*/