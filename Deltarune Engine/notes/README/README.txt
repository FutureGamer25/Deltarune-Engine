State Machines
========================================
To create a state machine, you must define your states as structs. The properties the structs can have are:
- enter
- leave
- step
- draw

The state machine is then created as shown below:

	new state_machine("initialState", stateStruct);

A more detailed example is provided below.


State Machine Functions
-----------------------
change(newStateName, parameters): Change the current state
step(): Run the state's step function
draw(): Run the state's draw function
get_state(): Returns the current state name
get_previous_state(): Return the previous state name
get_ticks(): Returns the number of Step events run for the current state

add(stateName, stateStruct): Add a new state to the machine
remove(stateName): Delete a state from the machine


Example Usage
-------------

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

