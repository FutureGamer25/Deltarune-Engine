//init
global.cutscene_current = noone;

function cutscene_create() {
	var inst = instance_create_depth(0, 0, 0, obj_cutscene_handler);
	var func = function() {}; //use method to get the current scope
	inst.parentScope = method_get_self(func);
	global.cutscene_current = inst;
	return inst;
}

function cutscene_set_autodestroy(cutscene = global.cutscene_current, enable) {
	cutscene.autoDestroy = enable;
}

function cutscene_destroy(cutscene = global.cutscene_current) {
	if instance_exists(cutscene) {
		instance_destroy(cutscene);
	}
}

function cutscene_run(cutscene = global.cutscene_current) {
	with cutscene {
		play = true;
	}
}

function cutscene_skip(cutscene = global.cutscene_current, scene_count = 1) {
	cutscene.currentThread.sceneIndex += scene_count;
}

function cutscene_pause(cutscene = global.cutscene_current) {
	cutscene.play = false;
}

function cutscene_unpause(cutscene = global.cutscene_current) {
	cutscene.play = true;
}

function cutscene_use_variables(cutscene = global.cutscene_current, use_variables) {
	cutscene.useStringVariables = use_variables;
}

function cutscene_thread(cutscene = global.cutscene_current) {
	return cutscene.currentThread;
}