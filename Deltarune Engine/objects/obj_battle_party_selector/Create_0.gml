currentPartyMember = 0;
partySize = battle_get_party_count();

partyActionsSelected = []; // Overwritten by selection array stored in obj_battle
partyActionSelectedIndexes = array_create(partySize, 0);

currentSelector = instance_create_depth(0, 0, TEMP_BATTLE_DEPTH, obj_battle_action_selector);


undoAction = function() {
	if (currentPartyMember == 0) {
		return;
	}

	currentSelector.close();
	currentPartyMember -= 1;

    currentSelector = instance_create_depth(0, 0, TEMP_BATTLE_DEPTH, obj_battle_action_selector);
    currentSelector.open(
		partyActionSelectedIndexes[currentPartyMember],
		selectAction,
		undoAction
	);
};
selectAction = function(newSelection, selectionIndex) {
    array_push(partyActionsSelected, newSelection);
    actionSelectionIndexes[currentPartyMember] = selectionIndex;

	currentPartyMember += 1;
	if (currentPartyMember >= partySize) {
		battle_set_state("playerActionRun");
	}

    currentSelector = instance_create_depth(0, 0, TEMP_BATTLE_DEPTH, obj_battle_action_selector);
	currentSelector.open(
		partyActionSelectedIndexes[currentPartyMember],
		selectAction,
		undoAction
	);
};


open = function(selectionArray) {
	partyActionsSelected = selectionArray;
};
