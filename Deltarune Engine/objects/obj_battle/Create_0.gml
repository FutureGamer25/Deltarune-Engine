bgmId = noone;//audio_play_sound(bgm, 100, true);


turn = 0;
party = party_get_array();
enemyUnits = [];
partyUnits = [];

partyActionsSelected = [];

// Create display objects
var unitDepthOffset = 999;
instance_create_depth(0, 0, depth - 100, obj_battle_background, {battle_bg: battle_bg});
instance_create_depth(0, 0, depth - 200, obj_battle_party);


for (var i = 0; i < array_length(enemies); i++)
{
	enemyUnits[i] = instance_create_depth(
		x + 270 + i * 5,
		y + 55 + i * 45,
		depth - i - unitDepthOffset,
		obj_battle_unit_enemy,
		{
			unit: enemy_get(enemies[i])
		}
	);
}

for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_depth(
		x + 70 + i * 5,
		y + 55 + i * 45,
		depth - i - unitDepthOffset,
		obj_battle_unit_party,
		{
			unit: party_get(global.party[i])
		}
	);
}


// Create battle state machine
stateController = noone;
battleState = new state_machine(
	{
		"intro": {
			"step": function() {
				battle_set_state("actionSelection");
			}
		},

		"actionSelection": {
			"enter": function() {
				stateController = instance_create_depth(0, 0, 0, obj_battle_party_selector);
				stateController.open(partyActionsSelected);
			},
		},

		"playerActionRun": {
			"enter": function() {
				show_message("Player Action Run");
				stateController = instance_create_depth(0, 0, 0, obj_battle_player_action_run);
			},
		},

		"enemyAttackRun": {
			"enter": function() {
				show_message("Enemy Attack Run");
				stateController = instance_create_depth(0, 0, 0, obj_battle_enemy_attack_run);
			},
		},

		"outro": {
			"enter": function() {
				show_message("Outro");
				stateController = instance_create_depth(0, 0, 0, obj_battle_outro);
			},
		},
	}
);
battleState.set_state("intro");
