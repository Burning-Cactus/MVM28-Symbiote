class_name State
extends Node

var parent: CharacterBody2D
@onready var state_machine: StateMachine = get_parent()

# Initialize the entity's new state
func start():
	pass

# Called every frame
func update(delta: float):
	pass

# Called every physics frame
func physics_update(delta: float):
	pass

# Clean up in preparation for the next state
func stop():
	pass
