global.enemyData = {
	"frgoot": {
		name: "frgoot",
		hp: 100,
		atk: 123123,
		def: 4,
		sprites: {idle: spr_enemy_idle,hurt: spr_enemy_hurt}
	},
}

function enemy_get(name_or_index) {
	//if is_real(name_or_index) { //get member
	//	if (name_or_index >= array_length(global.party)) return undefined;
	//	name_or_index = global.party[name_or_index];
	//}
	return global.enemyData[$ name_or_index];
}