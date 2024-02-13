/// @desc
var confirm = input_check_pressed("confirm");

xx += (1/room_speed);

//show_debug_message(xx);

if xx = 2 can_hit = false; //time limit on how long you can hit


if can_hit { //it has not crossed the fight box yet
	if confirm { #region hit
		if xx >= 0.9 && xx <= 1.1 { //in bullsye range
			damage = value+15; //hit the spot	
		}else{
			damage = lerp(value,0,xx/281); //ye idk actually
		}
		show_debug_message(damage);
	}#endregion	
}


