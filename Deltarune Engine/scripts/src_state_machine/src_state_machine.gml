/// @function state_machine(states)
/// @description Creates a state machine using given states
/// @param {string} initialState The first state to apply
/// @param {struct} states The list of states available to transition between.

/*
	Example:

	var stateIdle = {
		enter: function() {},
		leave: function() {},
		step: function() {},
		draw: function() {}
	};

	...

	// States can be passed in directly
	new state_machine(
		"idle",
		{
			idle: stateIdle,
			run: stateRunning,
			jump: stateWalking
		}
	);

	// They can also be passed indirectly in case parameters need to be passed
	// Example: function() { return StateRun(runSpeed); }
	new state_machine(
		"idle",
		{
			idle: function() { return stateIdle(); },
			run: function() { return stateRun(); },
			jump: function() { return stateJump(); }
		}
	);
*/

function state_machine(_initialState, _states) constructor
{
	assert(is_struct(_states));

	origin = other;
	states = {};
	currentState = _initialState;
	previousState = "";
	currentEvent = "";
	ticks = 0;

	var stateNames = variable_struct_get_names(_states);
	for (var i = 0; i < array_length(stateNames); i++)
	{
		add(stateNames[i], _states[$ stateNames[i]]);
	}

	static get_state = function()
	{
		return currentState;
	}
	
	static get_previous_state = function()
	{
		return previousState;
	}
	
	static get_ticks = function()
	{
		return ticks;
	}
	
	static add = function(_stateName, _state)
	{
		assert(is_struct(_state));

		var properties = variable_struct_get_names(_state);
		for (var i = 0; i < array_length(properties); i++)
		{
			_state[$ properties[i]] = method(origin, _state[$ properties[i]]);
		}
		
		states[$ _stateName] = _state;
	}
	
	static add_child = function(_parentName, _stateName, _state)
	{
		self.add(_stateName, _state);
		
		states[$ _stateName][$ "parent"] = _parentName;
	}
	
	static remove = function(_stateName)
	{
		variable_struct_remove(states, _stateName);
	}
	
	static change = function(_stateName, _enterParams = {})
	{
		assert(variable_struct_exists(states, _stateName));

		if (states[$ currentState][$ "leave"])
		{
			currentEvent = "leave";
			states[$ currentState].leave();
		}
		
		previousState = currentState;
		currentState = _stateName;
		ticks = 0;

		if (states[$ currentState][$ "enter"])
		{
			currentEvent = "enter";
			states[$ currentState].enter(_enterParams);
		}
	}
	
	static step = function()
	{
		ticks += 1;
		
		if (states[$ currentState][$ "step"])
		{
			currentEvent = "step";
			states[$ currentState].step();
		}
	}
	
	static draw = function()
	{
		if (states[$ currentState][$ "draw"])
		{
			currentEvent = "draw";
			states[$ currentState].draw();
		}
	}
	
	static inherit = function()
	{
		if (variable_struct_exists(states[$ currentState], "parent"))
		{
			var parentState = states[$ currentState][$ "parent"];

			if (states[$ parentState][$ currentEvent])
			{
				states[$ parentState][$ currentEvent]();
			}
		}
	}
}

function state_stack() constructor
{
	states = [];
	
	static step = function()
	{
		states[array_length(states) - 1].step();
	}
	
	static draw = function()
	{
		for (var i = 0; i < array_length(states); i++)
		{
			states[i].draw();
		}
	}
	
	static clear = function()
	{
		states = [];
	}
	
	static push = function(state, _enterParams)
	{
		array_push(states, state);
		state.enter(_enterParams);
	}
	
	static pop = function()
	{
		states[array_length(states) - 1].leave();
		array_pop(states);
	}
}


/// @function assert(value)
/// @description Throws an error if the value passed is not true.
/// @param {bool} value The value to check for truth.
function assert(_value)
{
	if (!is_boolean(_value))
	{
		show_error("Invalid value passed to Assert. Value must be type \"bool\".", true);
	}
	
	if (!_value) show_error("Assertion Failed", true);
}

function is_boolean(_value)
{
	return is_bool(_value) || (is_real(_value) && (_value == 0 || _value == 1));
}
