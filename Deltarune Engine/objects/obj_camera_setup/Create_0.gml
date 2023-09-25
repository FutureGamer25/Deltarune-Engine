camera = camera_setup_view(0, global.camWidth, global.camHeight);

var camObj = instance_create_depth(0, 0, 0, obj_camera);
camObj.camera = camera;
if (centered) camObj.mode = "center";