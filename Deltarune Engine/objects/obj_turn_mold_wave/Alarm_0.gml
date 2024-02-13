/// @desc
if inst_count <= 0{
	alarm[1]= (60*2);
}else{
	alarm[0]= 60;
	inst_count--
	var _l  = obj_battle_ut.targ_l
	var _r  = obj_battle_ut.targ_r
	var _xx = random_range(_l-5,_r-35)
	inst[inst_count] = battle_bullet_create(_xx,enemy.y-(enemy.sprite_height/2),depth-10,obj_bullet_mold_wave);
}
