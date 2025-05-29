class_name StateMachine
extends Node

var parent: Node2D

@export var default_state: State

var states: Dictionary = {}
var active_state: State 

func _ready() -> void:
	parent = get_parent()
	var children = get_children()
	for state in children:
		assert(state is State, "ERROR: Non-state included in state machine node!")
		state.parent = parent
		states[state.name.to_lower()] = state
	
	if default_state == null:
		default_state = children[0]
	
	active_state = default_state
	
	for node in states.values():
		print("State: ", node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	active_state.update(delta)

func _physics_process(delta: float):
	active_state.physics_update(delta)

# Call this to make a clean switch to a new state.
func switch_state(new_state: String):
	active_state.stop()
	active_state = states[new_state]
	active_state.start()
