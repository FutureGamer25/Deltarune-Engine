#region item constructors
/*function __item() constructor { //optional parent
	static select_member = function(_method) {
		
	}
}*/

//function __item_heal(_hp) : __item() constructor {
function __item_heal(_hp) constructor {
	static run = function() {
		select_member(heal);
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
	static heal = function(member) {
		//heal member
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

global.items = {
	"candy" : new __item_heal(5),
	"new_item" : new __item_heal_all(22)
};