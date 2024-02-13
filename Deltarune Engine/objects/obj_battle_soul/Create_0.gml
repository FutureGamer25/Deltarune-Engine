/// @desc
_t					= obj_battle_ut.targ_t+13;
_l						= obj_battle_ut.targ_l+13;	
_r					= obj_battle_ut.targ_r-13;
_b					= obj_battle_ut.targ_b-13;

slowSpeed = 60 * global.dt;
normSpeed = 120 * global.dt;
slowing = false;

show_debug_message("L: " + string(_l) + " _R:" + string(_r));