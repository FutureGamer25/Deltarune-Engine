open = function(selectCallback, undoCallback) {
	selectCallback({
		type: "defend"
	});
};

close = function() {
	instance_destroy();
};
