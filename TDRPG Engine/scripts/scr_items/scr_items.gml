#region item constructors
function __item(_name, _desc) constructor {
	name = _name;
	desc = _desc;
	type = "basic";
	static remove_self = function(struct) {
		var _x = struct.x;
		var _y = struct.y;
		//remove from inventory
	}
}

function __item_heal(_name, _desc, _hp) : __item(_name, _desc) constructor {
	hp = _hp;
	type = "heal";
	static run = function(struct) {
		var member = struct.member;
		//heal member
		remove_self(struct);
	}
}

function __item_heal_all(_name, _desc, _hp) : __item(_name, _desc) constructor {
	hp = _hp;
	type = "heal_all";
	static run = function(struct) {
		//heal everyone
		remove_self(struct);
	}
}
#endregion

#region item functions
//item_run("candy", {x: 1, y: 2, member: 0});
function item_run(item_key, param_struct = {}) {
	global.items[$ item_key].run(param_struct);
}

function item_struct(item_key) {
	return global.items[$ item_key];
}
#endregion

global.items = {
	"candy" : new __item_heal("Candy", "Good for the soul.", 5),
	"new_item" : new __item_heal_all("Unnamed", "Undescribable.", 10)
};