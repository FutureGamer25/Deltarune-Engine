global.party = [];
global.partyData = {};

function party_reset_data() {	
	//all member data
	global.partyData = {
		"player": {
			name: "Player",
			hp: 100,
			maxHp: 100,
			atk: 20,
			def: 4,
			sprites: {idle: spr_idle_temp,attack: spr_attack_temp,defend: spr_defend_temp,down: spr_down_temp},
			colour: c_white
		},
		"jeffrey": {
			name: "Jeffrey",
			hp: 1,
			maxHp: 1,
			atk: 1,
			def: 1,
			colour: c_orange
		},
		"kris": {
			name: "Kris",
			hp: 90,
			maxHp: 90,
			atk: 10,
			def: 2,
			sprites: {idle: spr_krisb_idle,attack: spr_krisb_attack,defend: spr_krisb_defend,down: spr_krisb_down},
			colour: c_aqua
		},
		"susie": {
			name: "Susie",
			hp: 110,
			maxHp: 110,
			atk: 14,
			def: 2,
			sprites: {idle: spr_susieb_idle,attack: spr_susieb_attack,defend: spr_susieb_defend,down: spr_susieb_down},
			colour: c_fuchsia
		}
	};
	//current members in party
	global.party = ["kris","susie","player"];
}

function party_get(name_or_index) {
	if is_real(name_or_index) { //get member
		if (name_or_index >= array_length(global.party)) return undefined;
		name_or_index = global.party[name_or_index];
	}
	return global.partyData[$ name_or_index];
}

function party_get_array() {
	var arr = [];
	for (var i=array_length(global.party)-1; i>=0; i--) {
	    arr[i] = global.partyData[$ global.party[i]];
	}
	return arr;
}

function party_add(name, index = array_length(global.party)) {
	array_insert(global.party, index, name);
}

function party_remove(name_or_index) {
	if is_string(name_or_index) { //find index of member
		name_or_index = array_get_index(global.party, name_or_index);
		if (name_or_index = -1) return;
	}
	array_delete(global.party, name_or_index, 1);
}

party_reset_data();