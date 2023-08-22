folCount = 0;
folSpacing = ceil(global.follower_delay * game_get_speed(gamespeed_fps));
playerPos = 0;
follower = [];
data = [];
data[0] = new __follower_data_obj(global.follower_player);