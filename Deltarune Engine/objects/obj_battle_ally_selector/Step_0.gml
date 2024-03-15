allyIndex = modulo(
	allyIndex + input_check_pressed("down") - input_check_pressed("up"),
	array_length(allies)
);

if (input_check_pressed("confirm"))
{
	parentSelectCallback(allies[allyIndex]);
}
else if (input_check_pressed("cancel"))
{
	parentUndoMethod();
}
