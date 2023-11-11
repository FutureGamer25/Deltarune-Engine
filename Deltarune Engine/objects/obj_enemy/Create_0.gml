/// @desc
sparable		= 100;
tired			= true;
light			= false;			//turns enemy white
turn			= 0;

name			= Var_Struct_Default(enemy,"name","Enemy");
hp				= Var_Struct_Default(enemy,"hp",40);
max_hp			= Var_Struct_Default(enemy,"hp",40);
def				= Var_Struct_Default(enemy,"def",1);
atk				= Var_Struct_Default(enemy,"atk",1);
gold			= Var_Struct_Default(enemy,"gold",1);
exp_value		= Var_Struct_Default(enemy,"exp_value",1);

turn_max		= Var_Struct_Default(enemy,"turn_max",1);
turn_rnd		= Var_Struct_Default(enemy,"turn_rnd",true);
turn_text		= Var_Struct_Default(enemy,"turn_text",["Turn Example 1","Turn Example 2!!!","Turn Example 3?"]);
turn_list		= Var_Struct_Default(enemy,"turn_list",[obj_turn_mold_pop]);

sprite_index	= Var_Struct_Default(enemy,"spr",sprite_index);
image_xscale	= 2;
image_yscale	= 2;

init = variable_struct_get(enemy,"init")
step = variable_struct_get(enemy,"step")
draw = variable_struct_get(enemy,"draw")

draw_state = "idle";
if init != undefined init();

#region Text
//var _dio_pad = 10;
//inst = instance_create_depth(x,y-spr_height-_dio_pad,depth,obj_speech)
//if instance_exists(inst) obj_speech_typer.text = "TEST!"
#endregion

turn = 0;

enemy_attack = function() {
	var _length = array_length(turn_list)
	if turn_rnd {
		turn = irandom_range(0,_length-1);
	} else {
		turn = (turn + 1) % _length;
	}
	
	return turn_list[turn];
}

enemy_narration = function() {
	return turn_text[irandom(array_length(turn_text)-1)];
}

enemy_destroy = function() {
	instance_destroy();
}









