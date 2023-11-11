/// @desc
for (var i = 0; i < 9; ++i) {
	//var new_inst = instance_change(obj_bullet_mold_pre_pop)
    var new_inst = battle_bullet_create(x,y,depth,obj_bullet_mold_pop)
	new_inst.direction = (360/9)*i
	instance_destroy(self)
}
instance_destroy(self)

