/// @desc Enemy
#region Create Objects
enemy_names = global.battle_enemy_struct_names;

for (var i=0; i<array_length(enemy_names); i++) {
	enemy[i] = global.enemy_battle[$ enemy_names[i]];
}
enemy_total = array_length(enemy);

var _h = 240;
var _w = room_width-120;
var pos = Set_Spacing(60,_w,enemy_total);
for (var i = 0; i < enemy_total; ++i) {
    inst_enemy[i] = instance_create_depth(pos[i],_h,depth-10,obj_enemy,{enemy:enemy[i]});
}

show_enemy_name = false;
enemy_sel = 0;

#endregion