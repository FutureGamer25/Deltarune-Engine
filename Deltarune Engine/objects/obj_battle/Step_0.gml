if input_check_pressed("confirm") battle_end();

if (variable_struct_exists(battleState, "step"))
{
	battleState.get_state().step();
}
