
function set_enemy_data() {
	global.enemy_battle = {
		
		moldsmol : {
			//rnd_turn : false,		
			//cur_act : 0,
			
			hp  : 50,
			name : "Moldsmol",
			def : 0,
			atk : 6,
			gold : 1,
			exp_value : 1,
			draw : function (_state,_x,_y,_alpha){
				var wobble = sin(current_time/500)
				var wobble2 = wobble * wobble * 2 - 1
				draw_sprite_ext(spr_moldsmol,-1,_x+(wobble*25),_y,1.5+(wobble2*.5),1.5-(wobble2*.5),0,c_white,_alpha)		
			},
			
			intro_text : "Example Intro",
			turn_text : ["Example 1", "Example 2", "Example 3"],
			turn_list : [obj_turn_mold_wave],
			//turn_list : [obj_turn_mold_pop,obj_turn_mold_wave],
			turn_rnd : true
			
		},
		
		/*example : function()  { //change to another enemy lol
			//same as above
		}*/
	}
	
	global.enemy_battle_groups = {
		moldsmol_moldsmol : {
			intro_text : "fill later thanks",
			turn_text : "moldsmol.NR"
		}
	}
}