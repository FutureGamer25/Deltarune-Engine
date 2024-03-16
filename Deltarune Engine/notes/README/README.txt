State Machines
========================================
To create a state machine, you must define your states as structs.

These structs can have an arbitrary shape, but recommended
properties could include:
- enter
- leave
- step
- draw

The state machine is then created as shown below:

var fsm = new state_machine(states_struct);

A more detailed example is provided below.

State Machine Functions
-----------------------
set_state(state_name): Change the current state
get_state(): Gets the state data
get_state_name(): Get the current state name
prev_state_name(): Return the previous state name


Example Usage
-------------

var state_idle = {
	enter: function() {},
	leave: function() {},
	step: function() {},
	draw: function() {}
};

...

// States can be passed in directly
new state_machine(
	{
		idle: stateIdle,
		run: stateRunning,
		jump: stateWalking
	}
);

