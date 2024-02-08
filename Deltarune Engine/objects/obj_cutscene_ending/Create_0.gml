/// @description Insert description here
alarm[0]=60*3;
//alarm[0]=1;

text_func("sans_spr",function(_text,_spr){
     with(obj_end_sans){
		sprite_index = asset_get_index(_spr[0]);
		image_index = 0;
    }
});
text_func("gaster_spr",function(_text,_spr){
     with(obj_end_gaster){
		sprite_index = asset_get_index(_spr[0]);
		image_index = 0;
    }
});