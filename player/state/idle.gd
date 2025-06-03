extends State


# Initialize the entity's new state
func start():
	parent.play_animation("idle")
	parent.set_default_collision_box()

# Called every physics frame
func physics_update(delta: float):
	if Input.is_action_pressed("jump"):
		state_machine.switch_state("jump")
	elif Input.is_action_pressed("slide"):
		state_machine.switch_state("slide")
	elif Input.is_action_pressed("crouch"):
		state_machine.switch_state("crouch")
	if Input.get_axis("move_left", "move_right") >= 0.05:
		state_machine.switch_state("walk")

# Clean up in preparation for the next state
func stop():
	pass
