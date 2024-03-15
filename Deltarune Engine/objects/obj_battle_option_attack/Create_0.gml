enemySelector = noone;

parentSelectCallback = EMPTY_METHOD;
parentUndoCallback = EMPTY_METHOD;

open = function(selectCallback, undoCallback) {
	parentSelectCallback = selectCallback;
	parentUndoCallback = undoCallback;

	enemySelector = instance_create_depth(
		0,
		0,
		TEMP_BATTLE_DEPTH,
		obj_battle_enemy_selector
	);
	enemySelector.open(selectCallback, undoCallback);
};

close = function() {
	instance_destroy();
};

selectCallback = function(enemyId) {
	enemySelector.close();

	parentSelectCallback({
		type: "attack",
		enemyInstId: enemyId
	});
};
undoCallback = function() {
	enemySelector.close();

	parentUndoCallback();
};
