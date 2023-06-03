#region item constructors
function __item_heal(_hp) constructor {
	static run = function() {
		//start member selection and supply heal function
	}
	static heal = function(member) {
		//heal member
	}
	hp = _hp;
}

function __item_heal_all(_hp) constructor {
	static run = function() {
		//heal everyone
	}
	hp = _hp;
}
#endregion

#region item functions
function item_run(item) {
	item.run();
}

function item_get(name) {
	return global.items[$ name];
}
#endregion

/*global.items = {
	"candy" : new __item_heal(5)
};*/