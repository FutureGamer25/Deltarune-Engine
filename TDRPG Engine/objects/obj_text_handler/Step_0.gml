frame ++;

if (progress >= progressMax) exit;

typeTimer --;

playSound = false;

while (progress < progressMax && typeTimer <= 0) {
	progress ++;
	var char = string_char_at(text, progress);
	
	if (!is_undefined(typeSound)) {
		if (char != "\a" && string_pos(char, global.text_data.silent) = 0) {
			playSound = true;
		}
	}
	
	switch (char) {
	case "\a":
		var index = real(string_copy(text, progress + 1, 2));
		var func = funcType[index];
		if (!is_undefined(func)) func(id, funcParams[index]);
		progress += 2;
		break;
	case ",":
	case ";":
	case ":":
	case ".":
	case "!":
	case "?":
		typeTimer += typeSpeed + room_speed / 5;
		break;
	default:
		typeTimer += typeSpeed;
		break;
	}
}

if (!is_undefined(typeSound)) {
	if playSound {
		playSound = false;
		var snd = typeSound;
		if is_array(typeSound) {
			snd = typeSound[ irandom(array_length(typeSound - 1)) ];
		}
		audio_play_sound(snd, 0, false, global.text_data.gain);
	}
}