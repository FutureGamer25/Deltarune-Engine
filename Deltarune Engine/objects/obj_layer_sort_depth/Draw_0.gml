if (!layer_exists(layerId)) exit;

#region get instances
ds_priority_clear(priority);
var elements = layer_get_all_elements(layerId);

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
	with inst event_perform(ev_draw, ev_draw_normal);
}