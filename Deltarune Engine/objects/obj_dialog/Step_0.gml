if (!checkInputs) exit;

var confirm = input_check_pressed("confirm");
var cancel = input_check_pressed("cancel");

textbox_anim += .1;

if (state = "text") {
	if (textObj.is_finished()) {
		if confirm {
			if (!next_page()) {
				close();
			}
		}
	} else {
		if cancel {
			textObj.skip();
		}
	}
} else { //choice
	if confirm {
		state = "text";
		var key = optionKey[optionSelected];
		if is_undefined(key) {
			if (!next_page()) {
				close();
			}
		} else {
			set_text(lang_get_array(key));
		}
		exit;
	}
	
	var vertical = input_check_pressed("down") - input_check_pressed("up");
	optionSelected = modulo(optionSelected + vertical, array_length(optionKey));
}