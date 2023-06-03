var view = 0;
camera = camera_create_view(0, 0, global.view_width, global.view_height);
view_enabled = true;
view_visible[view] = true;
view_camera[view] = camera;

var camObj = instance_create_depth(0, 0, 0, obj_camera);
camObj.camera = camera;
if (centered) camObj.mode = "center";