instance_create_depth(0, 0, -100, obj_battle_background,{battle_bg: battle_bg});
instance_create_depth(0, 0, -200, obj_battle_party);
instance_create_depth(x+10,y+230,-999,obj_fight_button);
d=0;
d2=0;

units=[];
turn=0;
unit_turn_order=[];
unit_render_order=[];

//make enemies
for (var i=0; i<array_length(enemies); i++){
	enemy_units[i]=instance_create_depth(x+270+(i*5),y+55+(i*45),-999,obj_battle_unit_enemy,{unit: enemy_get(enemies[i])});
	array_push(units,enemy_units[i]);
	d++;
	enemy_units[i].depth-=d;
}

//make party
for (var i=0; i<array_length(global.party); i++){
	party_units[i]=instance_create_depth(x+70+(i*5),y+55+(i*45),depth-999,obj_battle_unit_party,{unit: party_get(global.party[i])});
	array_push(units,party_units[i]);
	d2++;
	party_units[i].depth-=d2;
}

//play music
audio_play_sound(bgm,100,true);