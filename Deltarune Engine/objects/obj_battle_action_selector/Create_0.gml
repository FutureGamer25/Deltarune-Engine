actionTypes = [
	{
		name: "attack",
		selectorObj: obj_battle_option_attack,
		sprite: noone,
	},
	{
		name: "act",
		selectorObj: obj_battle_option_act,
		sprite: noone,
	},
	{
		name: "item",
		selectorObj: obj_battle_option_item,
		sprite: noone,
	},
	{
		name: "spare",
		selectorObj: obj_battle_option_spare,
		sprite: noone,
	},
	{
		name: "defend",
		selectorObj: obj_battle_option_defend,
		sprite: noone,
	},
];
actionIndex = 0;
subSelector = noone;
isActivated = true;

parentSelectCallback = EMPTY_METHOD;
parentUndoCallback = EMPTY_METHOD;


open = function(startingIndex, selectAction, undoAction) {
	actionIndex = startingIndex;
	parentSelectCallback = selectAction;
	parentUndoCallback = undoAction;
};

close = function() {
	instance_destroy();
};

selectCallback = function(action) {
	parentSelectCallback(action, actionIndex);
};
undoCallback = function() {
	subSelector.close();
	alarm[0] = 1;
};
