/// @desc
if inst_count <= 0{
	turn_end();
}else{
	alarm[0]= 60;
	inst_count--
	var _l  = obj_battle_ut.targ_l
	var _r  = obj_battle_ut.targ_r
	var _xx = random_range(_l+20,_r-20)
	inst[inst_count] = battle_bullet_create(_xx,enemy.y-(enemy.sprite_height/2),depth,obj_bullet_mold_pre_pop)
}