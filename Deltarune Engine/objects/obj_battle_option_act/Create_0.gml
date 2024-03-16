selector = noone;

actMethod = EMPTY_METHOD;

parentSelectCallback = EMPTY_METHOD;
parentUndoCallback = EMPTY_METHOD;


event_user(15);


selectionState = new state_machine(
	{
		"enemySelection": {
			"enter": function() {
				selector = instance_create_depth(
					0,
					0,
					TEMP_BATTLE_DEPTH,
					obj_battle_enemy_selector
				);
				selector.open(
					onSelectEnemy,
					onCancelEnemySelection
				);
			}
		},

		"actSelection": {
			"enter": function(enemyInstId) {
				selector = instance_create_depth(0, 0, 0, obj_battle_act_selector);
				selector.open(partyActionsSelected);
			},
		}
	}
);
selectionState.set_state("enemySelection");
