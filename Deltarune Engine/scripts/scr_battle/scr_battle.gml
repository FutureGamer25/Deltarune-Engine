function Set_Battle_Box(_w= 165,_h= 140,_x=undefined,_y=320,_txt = undefined){
	_x ??= room_width/2
	
	with(obj_battle_ut){
			_txt ??= text
			show_text = false;
			targ_w = _w;
			targ_h = _h;
			targ_x = _x;
			targ_y = _y;
			if (_txt != text) {
				text = _txt
				
			}
			var _www = _w/2
			var _hhh = _h/2
			targ_t = _y-_hhh
			targ_l = _x-_www
			targ_r = _x+_www
			targ_b = _y+_hhh
		}
}

function Set_Nara_Box(_txt = undefined){
	Set_Battle_Box(574,140,320,320,_txt)
	show_debug_message(room_height)
	obj_battle_ut.show_text = true;
}

function Set_Nara_Text(_txt = undefined) {
	Set_Battle_Box(660,120,,68,_txt)
	obj_battle_ut.show_text = true;
	obj_battle_ut.text_progress = 0;
}
//TODO: Move
function Var_Struct_Default(_struct, _name, _default){
	return variable_struct_get(_struct,_name) ?? _default;
}

function battle_bullet_create(_x, _y, _depth, _obj, _dmg=damage) {
	return instance_create_depth(_x, _y, _depth, _obj, {damage : _dmg});
}

function battle_turn_create(_obj, _enemy) {
	return instance_create_depth(0, 0, obj_battle_ut.depth-5, _obj, {damage : _enemy.atk, enemy : _enemy});
}

//TODO: MOVE OR CHANGE
function Set_Spacing(_offset,_totalDist,_total){
	var _array = []
	for (var i = 0; i < _total; ++i) {
	    _array[i] = _totalDist*((i+1)/(_total+1))+_offset
	}
	return _array
}
