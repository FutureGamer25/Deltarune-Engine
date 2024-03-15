for (var i=0; i<array_length(enemies); i++) {
	if (i == enemyIndex) {
		draw_set_color(c_yellow);
	} else {
		draw_set_color(c_white);
	}
	draw_text(x + 15, x + 15 + i * 16, enemies[i].name)
}
