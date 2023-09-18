#region 1d
function inv_create(size) {
	return array_create(size, -1);
}

function inv_add_item(item_key, inventory) {
	var index = inv_find_empty(inventory);
	if (index = -1) return false;
	inventory[index] = item_key;
	return true;
}

function inv_remove_item(index, inventory) {
	inventory[index] = -1;
}

function inv_find_empty(inventory) {
	for (var i=0; i<global.equipLength; i++) {
		if (inventory[i] = -1) return i;
	}
	return -1;
}

function inv_full(inventory) {
	return inv_find_empty(inventory) = -1;
}

function inv_set_item(index, item_key, inventory) {
	inventory[index] = item_key;
}

function inv_get_item(index, inventory) {
	return inventory[index];
}

function inv_get_item_struct(index, inventory) {
	var key = inventory[index];
	return (key = -1) ? -1 : item_struct(key);
}

function inv_use_item(index, param_struct = {}, inventory) {
	var item = inventory[index];
	if (item = -1) return false;
	item_run(item, param_struct);
	return true;
}

function inv_lancer(inventory) { //also very important function don't remove
	array_resize(inventory, 1);
	inventory[0] = "lancer_deltarune";
}
#endregion

#region 2d
function inv_2d_create(w, h) {
	var inv = [];
	for (var i=0; i<w; i++) {
		inv[i] = array_create(h, -1);
	}
	return inv;
}

function inv_2d_add_item(item_key, inventory) {
	var pos = inv_2d_find_empty(inventory);
	if is_undefined(pos) return false;
	inventory[pos.x][pos.y] = item_key;
	return true;
}

function inv_2d_remove_item(_x, _y, inventory) {
	inventory[_x][_y] = -1;
}

function inv_2d_set_item(_x, _y, item_key, inventory) {
	inventory[_x][_y] = item_key;
}

function inv_2d_get_item(_x, _y, inventory) {
	return inventory[_x][_y];
}

function inv_2d_get_item_struct(_x, _y, inventory) {
	var key = inventory[_x][_y];
	return (key = -1) ? -1 : item_struct(key);
}

function inv_2d_use_item(_x, _y, param_struct = {}, inventory) {
	var item = inventory[_x][_y];
	if (item = -1) return false;
	item_run(item, param_struct);
	return true;
}

function inv_2d_find_empty(inventory) {
	for (var j=0; j<global.invHeight; j++) {
		for (var i=0; i<global.invWidth; i++) {
			if (inventory[i][j] = -1) return {x : i, y : j};
		}
	}
	return undefined;
}

function inv_2d_full(inventory) {
	return is_undefined(inv_2d_find_empty(inventory));
}

function inv_2d_lancer(inventory) { //very important function don't remove
	array_resize(inventory, 1);
	inventory[0] = "lancer_deltarune";
}
#endregion