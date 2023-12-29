_x=obj_battle.x+2;
_y=obj_battle.y+161;
var i=0;
repeat array_length(global.party){
	instance_create_depth(_x,_y,-300,obj_battle_party_member,{member: party_get(global.party[i])});
	//obj_battle_party_member.member=party_get(global.party[i]);
	_x+=104;
	i++;
}