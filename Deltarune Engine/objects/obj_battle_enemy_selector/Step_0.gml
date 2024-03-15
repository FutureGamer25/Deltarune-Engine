enemyIndex = modulo(
	enemyIndex + input_check_pressed("down") - input_check_pressed("up"),
	array_length(enemies)
);

if (input_check_pressed("confirm"))
{
	parentSelectCallback(enemies[enemyIndex]);
}
else if (input_check_pressed("cancel"))
{
	parentUndoMethod();
}
