move_towards_point(-10,y,spd);
if (x>eye.x){dist=x-eye.x} else if (x<eye.x){dist=eye.x-x}
if (input_check_pressed("confirm")){
	spd=0;
		//var damage_calc=(party_get(global.party[_id]).atk/dist)*50;
		//var damage=round(damage_calc);
		var damage_calc=member.atk*4;
		var damage = round(lerp(damage_calc,0,dist/120)/(target.def/4));
		target.hp-=damage;
		obj_battle.enemy_units[0].sprite_index=obj_battle.enemy_units[0].unit.sprites.hurt;
		alarm[0]=30;
		show_message(damage);
		show_message("hp of target: "+string(target.hp));
}
if (x<obj_battle.x){instance_destroy()}