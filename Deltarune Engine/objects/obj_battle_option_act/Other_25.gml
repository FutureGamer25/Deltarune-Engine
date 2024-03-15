/// @description Methods
open = function(selectCallback, undoCallback) {
	parentSelectCallback = selectCallback;
	parentUndoCallback = undoCallback;
};
close = function() {
	instance_destroy();
};


selectCallback = function(enemyInstId) {
	selector.close();

	parentSelectCallback({
		type: "act",
		actMethod,
		enemyInstId
	});
};
undoCallback = function() {
	selector.close();
	parentUndoCallback();
};


onSelectEnemy = function(enemyInstId) {
	selectionState.change("actSelection", enemyInstId);
};

onCancelEnemySelection = function() {
	parentUndoCallback();
};
