/// @desc Calculate Damage

//damage at bullseye
if !done{
	xx -= 4
	
	if xx < -5{ //miss
		miss = true;
	}
	
	if input_check_pressed("confirm"){
		if xx < 5 && xx > -5 {
			col = c_yellow;
			damage = value+15; //hit the spot	
		}else{
			damage = lerp(value,0,xx/150)
		}
		//enemy.hp -= floor(damage);
		hit = true;
		done = true;
		
		show_debug_message(damage);
		//inst_dmg = instance_create_depth(enemy.x,enemy.y-20,-100,obj_dmg_num,{dmg:damage})
		//Play_Once_Spr(party.fight_dmg_spr,enemy.x,enemy.y-20,-100);		
	}
}
if hit {
	image_speed = 1;
	image_alpha -= .1;
}
if miss image_alpha -= .1;

if image_alpha <= 0 {
	//o_fight_manager.func_next();
	instance_destroy();
}

