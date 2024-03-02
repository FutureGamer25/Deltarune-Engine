if (subSelector != noone) return;
if (!isActivated) return;

actionIndex = modulo(
	actionIndex + input_check_pressed("right") - input_check_pressed("left"),
	array_length(actionTypes)
);

if (input_check_pressed("confirm"))
{
	subSelector = instance_create_depth(
		0,
		0,
		TEMP_BATTLE_DEPTH,
		actionTypes[actionIndex].selectorObj
	);
	subSelector.open(selectCallback, undoCallback);
}
else if (input_check_pressed("cancel"))
{
	parentUndoMethod();
}
