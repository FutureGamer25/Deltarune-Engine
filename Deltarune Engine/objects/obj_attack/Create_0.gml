for (var i=0; i<array_length(global.party); i++){
	eye[i]=instance_create_depth(x,y+(i*38),-900,obj_attack_eye,{member: party_get(global.party[i])});
	bar[i]=instance_create_depth(x+irandom_range(40,80),y+(i*38),-1000,obj_attack_bar,{member: party_get(global.party[i]),_id: i,eye: eye[i]});
}