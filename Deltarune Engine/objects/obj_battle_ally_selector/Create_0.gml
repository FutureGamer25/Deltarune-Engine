allies = battle_get_party();
allyIndex = 0;

parentSelectCallback = EMPTY_METHOD;
parentUndoCallback = EMPTY_METHOD;

open = function(selectCallback, undoCallback) {
	parentSelectCallback = selectCallback;
	parentUndoCallback = undoCallback;
};

close = function() {
	instance_destroy();
};
