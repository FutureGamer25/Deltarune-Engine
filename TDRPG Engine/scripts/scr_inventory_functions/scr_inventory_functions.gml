#region grid
function inv_grid_create(w, h) {
	var inv = [];
	for (var i=0; i<w; i++) {
		inv[i] = array_create(h, -1);
	}
	return inv;
}

function inv_grid_add_item(item_key, inventory) {
	var pos = inv_grid_find_empty(inventory);
	if is_undefined(pos) return false;
	inventory[pos.x][pos.y] = item_key;
	return true;
}

function inv_grid_remove_item(_x, _y, inventory) {
	inventory[_x][_y] = -1;
}

function inv_grid_set_item(_x, _y, item_key, inventory) {
	inventory[_x][_y] = item_key;
}

function inv_grid_get_item(_x, _y, inventory) {
	return inventory[_x][_y];
}

function inv_grid_get_item_struct(_x, _y, inventory) {
	var key = inventory[_x][_y];
	return (key = -1) ? -1 : item_struct(key);
}

function inv_grid_use_item(_x, _y, param_struct = {}, inventory) {
	var item = inventory[_x][_y];
	if (item = -1) return false;
	item_run(item, param_struct);
	return true;
}

function inv_grid_find_empty(inventory) {
	for (var j=0; j<global.invHeight; j++) {
		for (var i=0; i<global.invWidth; i++) {
			if (inventory[i][j] = -1) return {x : i, y : j};
		}
	}
	return undefined;
}

function inv_grid_full(inventory) {
	return is_undefined(inv_grid_find_empty(inventory));
}

function inv_grid_lancer(inventory) { //very important function don't remove
	array_resize(inventory, 1);
	inventory[0] = "lancer_deltarune";
}
#endregion

#region list
function inv_list_create(size) {
	return array_create(size, -1);
}

function inv_list_add_item(item_key, inventory) {
	var index = inv_list_find_empty(inventory);
	if (index = -1) return false;
	inventory[index] = item_key;
	return true;
}

function inv_list_remove_item(index, inventory) {
	inventory[index] = -1;
}

function inv_list_find_empty(inventory) {
	for (var i=0; i<global.equipLength; i++) {
		if (inventory[i] = -1) return i;
	}
	return -1;
}

function inv_list_full(inventory) {
	return inv_list_find_empty(inventory) = -1;
}

function inv_list_set_item(index, item_key, inventory) {
	inventory[index] = item_key;
}

function inv_list_get_item(index, inventory) {
	return inventory[index];
}

function inv_list_get_item_struct(index, inventory) {
	var key = inventory[index];
	return (key = -1) ? -1 : item_struct(key);
}

function iv_list_use_item(index, param_struct = {}, inventory) {
	var item = inventory[index];
	if (item = -1) return false;
	item_run(item, param_struct);
	return true;
}

function inv_list_lancer(inventory) { //also very important function don't remove
	array_resize(inventory, 1);
	inventory[0] = "lancer_deltarune";
}
#endregion